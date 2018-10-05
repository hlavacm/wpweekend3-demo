<?php

/*
Plugin Name: WP Tracy
Plugin URI: https://github.com/ktstudio/wp-tracy/
Description: (Nette) Tracy connector for WordPress
Version: 2.0.1
Author: Martin Hlaváč
Author URI: https://www.hlavacm.net/
License: GPLv2
Text Domain: wp-tracy
Domain Path: /languages/
 */

if (!function_exists("add_action")) { // Make sure we don't expose any info if called directly
    wp_die("Hi there!  I\'m just a plugin, not much I can do when called directly.");
}

if (!empty($GLOBALS["pagenow"]) && "plugins.php" === $GLOBALS["pagenow"]) {
    add_action("admin_notices", "wp_tracy_admin_notices_action", 1); // check current and required PHP & WordPress versions

    function wp_tracy_admin_notices_action()
    {
        $phpMinVersion = "5.4.4";
        $phpCurrentVersion = phpversion();
        if (version_compare($phpMinVersion, $phpCurrentVersion, ">")) {
            $message = sprintf(__("Your server is running on PHP %s, but this plugin requires at least PHP %s. Please do the upgrade.", "wp-tracy"), $phpCurrentVersion, $phpMinVersion);
            echo "<div id=\"message\" class=\"error\"><p>$message</p></div>";
            return;
        }
        $wpMinVersion = "4.0";
        global $wp_version;
        if (version_compare($wpMinVersion, $wp_version, ">")) {
            $message = sprintf(__("Your WordPress is in version %s, but this plugin requires at least version %s. Please start the upgrade.", "wp-tracy"), $wp_version, $wpMinVersion);
            echo "<div id=\"message\" class=\"error\"q><p>$message</p></div>";
            return;
        }
    }
}

if (defined("WP_TRACY_PROGRAMMATICALLY_DISABLED") && WP_TRACY_PROGRAMMATICALLY_DISABLED) {
    return;
}

$pluginPath = __DIR__;
$vendorAutoloadPath = path_join($pluginPath, path_join("vendor", "autoload.php"));
if (!file_exists($vendorAutoloadPath)) { // composer check
    $message = __("First, install WP Tracy using Composer, run the command:", "wp-tracy");
    $command = "composer require hlavacm/wp-tracy";
    echo "<div id=\"message\" class=\"error\"><p>$message</p><p>$pluginPath><b>$command</b></></p></div>";
    return;
}

$loader = require $vendorAutoloadPath; // apply by composer

require path_join($pluginPath, "admin.php");

add_action("plugins_loaded", "wp_tracy_plugins_loaded_action");

function wp_tracy_plugins_loaded_action()
{
    load_plugin_textdomain("wp-tracy", false, basename(dirname(__FILE__)) . "/languages/");
}
