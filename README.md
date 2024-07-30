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

Install [Composer](https://getcomposer.org/download/) to your computer globally. After installing composer globally, navigate to the theme folder 'base' and run "composer install". Doing so will install [Codeception](https://codeception.com/) as a development dependency. NOTE: if there are any issues with dependency installation, it may be advisable to delete the "vendor" directory within the 'base' theme folder and run "composer install" again from within the theme directory.

Install Selenium globally as well on your computer as noted in the [Selenium Server info section](https://codeception.com/docs/03-AcceptanceTests). This will be required for running acceptance tests through Codeception. NOTE: You may have to install [NodeJS](https://nodejs.org/) and [Java](https://www.java.com/) on your computer as well depending on your development machine configuration.

On Mac, might need to install [Homebrew](https://brew.sh/) and update to php v7.4 per the following [documentation](https://discussions.apple.com/thread/253380264) because of a dependancy "ext-zip" which is required but may not have been included with your PHP version.

## Selenium issues

might have to run the following if there are issues running tests for selenium-standalone-start
selenium-standalone start --chromeDriver="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --host 0.0.0.0 --drivers.chrome.args=--remote-debugging-address=0.0.0.0 --drivers.chrome.args=--remote-debugging-port=9222

## Chromium notes

If you receive error notes regarding ChromeDriver and versions and/or have updated your version of Chrome, you may have to update your global version of selenium-standalone.

- sudo npm update -g selenium-standalone
- sudo selenium-standalone install

## Upgrading CSS File Generation Process

We've transitioned away from using the wp-scss plugin for generating CSS files from SCSS files. Instead, we've adopted the node-sass NPM package, which should be installed in the theme root directory (assets\themes\'base').

### Installation Instructions

1. **Install node-sass:**

   - Ensure you have node-sass installed in the theme root directory.
   - Navigate to the theme root directory and run the following command, the `package.json` file is already placed to the same location.:
     ```
     npm install
     ```

2. **Generate CSS Files:**
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
