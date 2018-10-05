=== WP Tracy ===
Contributors: hlavacm
Donate link: https://www.hlavacm.net/
Tags: tracy, debugger
Version: 2.0.1
Requires at least: 4.0
Tested up to: 4.9
Requires PHP: 5.4.4
Stable tag: 4.9
License: GPLv2
License URI: http://www.gnu.org/licenses/gpl-2.0.html

WP Tracy is a plugin that automatically inserts debugger (Nette) Tracy into WordPress. 

== Description ==

[Tracy](https://github.com/nette/tracy) is an excellent PHP debugger bar from [Nette](https://nette.org) PHP framework. 
[WP Tracy](https://github.com/ktstudio/wp-tracy) is simple implementation and integration of Tracy into WordPress (for test environment).
When it's activated, it automatically shows Tracy bar and displays within global WP constants and their values. 
It's great for local(host) development. 
Simple setup is available in the Administration Tools menu and some constants are in the code.

== Installation ==

1. Upload the `wp-tracy` folder to the `/wp-content/plugins/` directory
2. Activate the WP Tracy plugin through the `Plugins` menu in WordPress
3. You can optionally change default settings in the administration Tools menu.
4. Profit!
5. You can optionally define some constants in the code:
5.1 WP_TRACY_ADMIN_DISABLED - true
5.2 WP_TRACY_CHECK_IS_USER_LOGGED_IN - `on`/`off`
5.3 WP_TRACY_ONLY_FOR_USER_ID - some (existing) user ID (as number)
5.4 WP_TRACY_ENABLE_MODE - `detect`/`development`/`production`
5.5 WP_TRACY_PANELS_FILTERING_ALLOWED - `on`/`off`

== Frequently Asked Questions ==

= What is Tracy? =

[Tracy](https://github.com/nette/tracy) is debugger bar and useful PHP library and helper for a everyday programmer's use.

= What is WP Tracy? =

It is Tracy integration into the WP, including system information (global variables) of WordPress.

= Is WP Tracy active in the production environment? =

By default not, but it depends on the settings.

= Has WP Tracy the visual settings? =

Yes, there is a simple setup in the administration Tools menu.

= Can I change default settings? =

Yes, you can define constants in the code - but they must be defined in the action `init` with priority 1.

1. WP_TRACY_ADMIN_DISABLED - true
2. WP_TRACY_CHECK_IS_USER_LOGGED_IN - `on`/`off`
3. WP_TRACY_ONLY_FOR_USER_ID - some (existing) user ID (as number)
4. WP_TRACY_ENABLE_MODE - `detect`/`development`/`production`
5. WP_TRACY_PANELS_FILTERING_ALLOWED - `on`/`off`

There is a special constant WP_TRACY_PROGRAMMATICALLY_DISABLED that allows you to uninitialized the plugin from the code. For example, It is used for a console. However it must be defined before plugins loaded.

= What information / panels are displayed? =

The following panels are visible by default (if they are available):

- WP
- WP User
- WP Post
- WP Query
- WP Queried Object
- WP Db
- WP Roles
- WP Rewrite
- WP Current Screen

= Can I change the panel order or add my own? =

Yes, you can define the `wp_tracy_panels_filter`, where you can modify the panels array.

== Screenshots ==

1. (WP) Tracy bar auto-display after plugin activation
2. Tracy exception screen
3. WP versions constants
4. WP (Logged) User information
5. (global) WP Post information
6. (global) WP Query information
7. (global) WP DB information
8. Simple setup in the administration Tools menu

== Changelog ==

= 2.0.1 =

* Added constant WP_TRACY_PROGRAMMATICALLY_DISABLED check (before initialization)

= 2.0.0 =

* Simple setup page in the administration Tools menu with Czech translation
* New constants in the code for default values and behavior
* Update for Tracy 2.5
* Two new panels for $wp_roles and $current_screen

= 1.0.5 =

* Initialization is now in scope of WP init action
* Added WP_TRACY_ENABLE_MODE and wp_tracy_panels_filter
* Update for Tracy 2.4.2

= 1.0.4 =

* Update for Tracy 2.4(.1)

= 1.0.3 =

* Added new get_queried_object() based panel
* Update Tracy 2.3.8 

= 1.0.2 =

* Update Tracy 2.3.7 

= 1.0.1 =

* DOING_AJAX check - for IE compatibility WordPress media upload, thanks to @ViliamKopecky
* Added constants for translation of error messages
* Removed Nice Name parameter from User panel

= 1.0 =

* The first version of plugin including (Nette) Tracy 2.3.5 

== Upgrade Notice ==

* There are no upgrade notice, this is the first version... 