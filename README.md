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

## Setting the Network Gateway IP
To configure the network gateway IP in the Acceptance.suite.yml file, follow these steps:

##### 1. Execute the Shell Script
After running `docker compose up -d`, you need to execute the `set_network_gateway_ip.sh` shell script. This script will set the required network gateway IP.

##### 2. Make the Script Executable
Before running the script, ensure it has executable permissions. Use the following command to do this:
```
chmod +x set_network_gateway_ip.sh
```
##### 3. Run the Test Case
Once the script is executable and the gateway IP is set, you can run your test cases with the following command:
```
docker compose run --rm codecept run Acceptance FirstTestCest:homepageTest
```
## Upgrading CSS File Generation Process

We've transitioned away from using the wp-scss plugin for generating CSS files from SCSS files. Instead, we've adopted the node-sass NPM package, which should be installed in the theme root directory (wp-content\themes\'base').

### Installation Instructions

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
