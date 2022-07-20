<?php


/** MOVE WP STANDARD FILES LOCATION (renamed wp-content to assets) **/
//$protocol = stripos($_SERVER['SERVER_PROTOCOL'], 'https') === 0 ? 'https://' : 'http://';
$protocol = 'https://';
define('WP_CONTENT_DIR', $_SERVER['DOCUMENT_ROOT'] . '/assets');
define('WP_CONTENT_URL', $protocol . $_SERVER['SERVER_NAME'] . '/assets');
define('WP_PLUGIN_DIR', $_SERVER['DOCUMENT_ROOT'] . '/assets/plugins');
define('WP_PLUGIN_URL', $protocol . $_SERVER['SERVER_NAME'] . '/assets/plugins');
define('PLUGINDIR', $_SERVER['DOCUMENT_ROOT'] . '/assets/plugins');

define('wp_iv_directories_template', $_SERVER['DOCUMENT_ROOT'] . '/assets/themes/mmu2/lawyerdirectory/');

/** END MOVE STANDARD LOCATION  */
//place at bottom above the require call require_once ABSPATH . 'wp-settings.php';
