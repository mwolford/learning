# Structurizr DSL Learning Notes

> [!NOTE]
> The examples are not a realy system or solution. This also might not be the best Architecture, this was made just for the purposes of learning DSL.

## Styling DSL with Tags

In Structurizr DSL, you can style your diagrams using tags. Tags are a way to categorize and style elements and relationships. You can define styles for tags and those styles will be applied to all elements and relationships with that tag.

## Includes

For more information on how to use `!include`, refer to the [Structurizr DSL documentation](https://docs.structurizr.com/dsl/includes).

In Structurizr DSL, you can also include other DSL files using the `!include` directive. This is particularly useful when you want to reuse elements across multiple diagrams or files.

For example, if you have a file `models\customerCard.dsl`  that defines some models, you can include it in another DSL file as shown in `eCommerce-includes-example.dsl`.

## Extends

For more information on how to use `extends`, refer ot the [Structurizr DSL documentation](https://docs.structurizr.com/dsl/cookbook/workspace-extension/).

In Structurizr DSL, you can extend a workspace using the `extends` directive. This is particularly useful when you want to inherit elements and relationships from another workspace and make modifications in the extending workspace.

For example, if you have a workspace defined in `cct_workspace.dsl`, you can extend it in another DSL file as shown in `eCommerce-extends-example.dsl`. This allows the `eCommerce-extends-example.dsl` to adjust and reuse elements while still respecting the base workspace elements.

## Workflows & Actions

To align with how I operate for .NET I wanted a way for checks and balances to be done on pull request's and merges to main.  Thanks to the [Structurizr CLI](https://docs.structurizr.com/cli/installation) this was able to be done quickly in a custom action.  I started on a path of exposing the CLI via an action doing Docker but then found that had ineffeciencies due for the fact I wanted to validate all files in a folder.  Below are the 2 actions I created

### Problem Statement

Run the CLI Command `inspect` or `validate` for all DSL files found in a folder and subfolders to ensure the DSL is following the standards and is validte.

### structurizr

This action simplifies the action to a single `checkout` and `docker pull`.  It uses Powershell to locate all files, then pulls the docker and loops on the files checking for the passed command (`inspect` or `validate`), aggregates the results and reports back only files with concerns on the output.  It will fail the whole action if only 1 file has a concern.  This is the action in use on [the current pull_request.yml](./.github/workslows/pull_request.yml).



### structurizr_cli

My first attempt was to create a way to run the CLI from Docker and using the [Github Matrices Strategy](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs).  I first tried to utilize the [public docker from structurizr](https://hub.docker.com/r/structurizr/cli) but I was unsuccessful.  This lead me to making my own Dockerfile based off [aidmax](https://github.com/aidmax/structurizr-cli-docker) as he has archived his solution.  This action does work but only can run for 1 file at a time so I then leveragered Matrix Strategy to run per file.  This then lead to ineffeciencies as it will for each file; checkout, pull he docker, run the command.  This then lead me to the refactor of [structurizr action](#structurizr).  Below is what the workflow would look like using this action:

``` yml
name: Structurizr Validate
on:
  pull_request

jobs:

  findDSLFiles:
    name: Find all DSL files in the systems folder
    runs-on: ubuntu-latest
    outputs:
      dslFiles: ${{ steps.findFiles.outputs.dslFiles }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - id: findFiles
        run: |
            $files = Get-ChildItem -Path ./structurizr-dsl -File -Recurse -Filter *.dsl | Resolve-Path -Relative
            Write-Host "Discovered DSL: $($files | ConvertTo-Json -AsArray)"
            "dslFiles=$($files | ConvertTo-Json -AsArray -Compress)" >> $env:GITHUB_OUTPUT
        shell: pwsh

  validate:
    name: Validate the DSL files
    needs: findDSLFiles
    strategy:
      matrix: 
        dslFiles: ${{ fromJSON(needs.findDSLFiles.outputs.dslFiles) }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Inspect DSL Files
        uses: ./.github/actions/structurizr_cli
        with: 
          command: 'validate'
          workspace: ${{ matrix.dslFiles }}
```



