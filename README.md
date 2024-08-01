# wordpress-base

Basic opinionated starter for WordPress local development with Docker. 

We are only including using Wordpress as the CMS of choice and are Included in the repository are only the files and do not include the database tables

- Theme files
- Suggested plugins

# Prerequisites
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) 

# Visual Studio Code Tools

We are using [Visual Studio Code](https://code.visualstudio.com/) along with the following extensions. A configuration file has been integrated into the codebase to ensure that all formatting remains the same. Note: versions listed below are minimum version.

- ESLint 2.1.14
- PHP Debug 1.14.9
- PHP Extension Pack 1.0.2
- PHP IntelliSense 2.3.14
- PHPfmt 1.0.3
- PostCSS Sorting 3.0.1
- Prettier - Code formatter 5.9.2
- SQL Formatter 1.4.4
- Twig 1.0.2

Search and install the above extensions once you have downloaded and installed visual studio code.

EASIER METHOD for installing extension dependencies
After installing Visual studio code, visit VSC Marketplace and installing the following extension [here](https://marketplace.visualstudio.com/items?itemName=aslamanver.vsc-export) and click the "Install" button to begin installing the extension. After the extension has been installed, follow the directions to import the vsc-extensions.txt file located in the root of this repository. NOTE: there may be more extensions installed than noted above.

# Additional Development Tools

## Selenium Docker
https://hub.docker.com/r/selenium/standalone-chrome
See the section "(Optional) To see what is happening inside the container, head to... " to visually see what is going on.



## Upgrading CSS File Generation Process

We've transitioned away from using the wp-scss plugin for generating CSS files from SCSS files. Instead, we've adopted the node-sass NPM package, which should be installed in the theme root directory (wp-content\themes\'base').

### Installation Instructions

**Generate CSS Files:**
   - Once all packages are installed, execute the following command to compile SCSS files into CSS:
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
