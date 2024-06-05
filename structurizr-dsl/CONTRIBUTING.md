## Visual Studio Code Extensions

For syntax highlighting and preview of diagrams within Visual Studio Code, we recommend using the `systemticks` extension. Please note that this extension requires Java 17 or greater.

### Installation

1. Install Java 17 or greater. You can download it from the [official Oracle website](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html).
2. Install the `systemticks.c4-dsl-extension` extension in Visual Studio Code. You can find it in the Extensions view (Ctrl+Shift+X) by searching for `systemticks.c4-dsl-extension`.
3. After installation, open a `.dsl` file and you should see syntax highlighting and be able to preview diagrams.

### Rendering

The diagrams will not render in github as it needs a tool to do so; which is what the VSCode extension does by sending the DSL code [Structrurizr service](https://www.structurizr.com/dsl).  The other option is to download a hosting tool as listed on [Structurizr Community Tools](https://docs.structurizr.com/community#rendering-tools).
