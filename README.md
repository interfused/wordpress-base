# wordpress-base

Basic opinionated starter for WordPress local development with Docker.

We are only including using Wordpress as the CMS of choice and are Included in the repository are only the files and do not include the database tables

-   Theme files
-   Suggested plugins

# Prerequisites

-   Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

Rename the .env.SAMPLE to .env and replace with your appropriate details

# Visual Studio Code Tools

We are using [Visual Studio Code](https://code.visualstudio.com/) along with the following extensions.
[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

# Additional Development Tools

## Selenium Docker

https://hub.docker.com/r/selenium/standalone-chrome
See the section "(Optional) To see what is happening inside the container, head to... " to visually see what is going on.

## CSS/SCSS changes

We've adopted the sass NPM package, which should be installed in the theme root directory (wp-content\themes\'base').

### Installation Instructions

Docker compose should take care of the installation

**Generate CSS Files:**

-   Once all packages are installed, open the docker container then find the appropriate WordPress theme folder. Execute the following command to compile SCSS files into CSS:
    ```
    npm run css
    ```

### Live Updates

To observe live updates of your changes:

```
npm run css:watch
```

This command will monitor the "sass" folder and automatically generate the corresponding CSS files in the "css" folder whenever changes are made to the SCSS files.

**This step is highly recommended for local development purposes.**
