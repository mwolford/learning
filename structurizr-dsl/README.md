# Structurizr DSL Learning Notes

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
