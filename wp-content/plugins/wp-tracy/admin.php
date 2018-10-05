<?php

add_action("admin_menu", "wp_tracy_admin_menu_action");

function wp_tracy_admin_menu_action()
{
    if (defined("WP_TRACY_ADMIN_DISABLED") && WP_TRACY_ADMIN_DISABLED) {
        return;
    }

    add_submenu_page(
        "tools.php",
        sprintf(__("%s - Settings", "wp-tracy"), "WP Tracy"),
        "WP Tracy",
        "manage_options",
        "wp-tracy-settings",
        "wp_tracy_settings_admin_page_callback"
    );

    add_action("admin_init", "wp_tracy_admin_init_action");
}

function wp_tracy_admin_init_action()
{
    register_setting("wp-tracy-settings", "wp-tracy-user-settings");
}

function wp_tracy_settings_admin_page_callback()
{
    $values = get_option("wp-tracy-user-settings") ?: [];
    $checkIsUserLoggedInValue = wp_tracy_settings_get_value($values, "check-is-user-logged-in", FILTER_SANITIZE_FULL_SPECIAL_CHARS, defined("WP_TRACY_CHECK_IS_USER_LOGGED_IN") ? WP_TRACY_CHECK_IS_USER_LOGGED_IN : "off");
    $onlyForUserIdValue = wp_tracy_settings_get_value($values, "only-for-user-id", FILTER_SANITIZE_NUMBER_INT);
    $debuggerModeValue = wp_tracy_settings_get_value($values, "debugger-mode", FILTER_SANITIZE_FULL_SPECIAL_CHARS, defined("WP_TRACY_ENABLE_MODE") ? WP_TRACY_ENABLE_MODE : "detect");
    $panelsFilteringAllowedModeValue = wp_tracy_settings_get_value($values, "panels-filtering-allowed", FILTER_SANITIZE_FULL_SPECIAL_CHARS, defined("WP_TRACY_PANELS_FILTERING_ALLOWED") ? WP_TRACY_PANELS_FILTERING_ALLOWED : "on");
    ?>
    <div class="wrap">
        <h1><?php echo get_admin_page_title(); ?></h1>
        <form method="post" action="options.php">
            <?php settings_fields("wp-tracy-settings"); ?>
            <?php do_settings_sections("wp-tracy-settings"); ?>
            <table class="form-table">
                <tr valign="top">
                    <th scope="row"><label for="wp-tracy-user-settings-check-is-user-logged-in"><?php _e("Check If User Is Logged In", "wp-tracy"); ?></label></th>
                    <td>
                        <select id="wp-tracy-user-settings-check-is-user-logged-in" name="wp-tracy-user-settings[check-is-user-logged-in]">
                            <option value="off" <?php selected($checkIsUserLoggedInValue, "off"); ?>><?php _e("Off", "wp-tracy"); ?></option>
                            <option value="on" <?php selected($checkIsUserLoggedInValue, "on"); ?>><?php _e("On", "wp-tracy"); ?></option>
                        </select>
                        <p id="wp-tracy-user-settings-check-is-user-logged-in-description" class="description"><?php _e("This option affects checking of logged users.", "wp-tracy"); ?></p>
                    </td>
                </tr>
                <tr valign="top">
                    <th scope="row"><label for="wp-tracy-user-settings-only-for-user-id"><?php _e("Only For User ID", "wp-tracy"); ?></label></th>
                    <td>
                        <input type="number" id="wp-tracy-user-settings-only-for-user-id" name="wp-tracy-user-settings[only-for-user-id]" min="1" step="1" value="<?php echo $onlyForUserIdValue; ?>" <?php echo ($checkIsUserLoggedInValue === "on") ? "" : "disabled"; ?>>
                        <p id="wp-tracy-user-settings-only-for-user-id-description" class="description">
                            <?php _e("Limit checking only for the specific user ID.", "wp-tracy"); ?><br>
                            <?php _e("Note: The field is (not) active depending on the value: \"Check if the user is logged in\" and the change will take effect after save.", "wp-tracy"); ?>
                        </p>
                    </td>
                </tr>
                <tr valign="top">
                    <th scope="row"><label for="wp-tracy-user-settings-debugger-mode"><?php _e("Debugger Mode", "wp-tracy"); ?></label></th>
                    <td>
                        <select id="wp-tracy-user-settings-debugger-mode" name="wp-tracy-user-settings[debugger-mode]">
                            <option value="detect" <?php selected($debuggerModeValue, "detect"); ?>><?php _e("Detect", "wp-tracy"); ?></option>
                            <option value="development" <?php selected($debuggerModeValue, "development"); ?>><?php _e("Development", "wp-tracy"); ?></option>
                            <option value="production" <?php selected($debuggerModeValue, "production"); ?>><?php _e("Production", "wp-tracy"); ?></option>
                        </select>
                        <p id="wp-tracy-user-settings-debugger-mode-description" class="description"><?php _e("One of the three options (constants) from class \"Tracy\Debugger\".", "wp-tracy"); ?></p>
                    </td>
                </tr>
                <tr valign="top">
                    <th scope="row"><label for="wp-tracy-user-settings-panels-filtering-allowed"><?php _e("Panels Filtering Allowed", "wp-tracy"); ?></label></th>
                    <td>
                        <select id="wp-tracy-user-settings-panels-filtering-allowed" name="wp-tracy-user-settings[panels-filtering-allowed]">
                            <option value="off" <?php selected($panelsFilteringAllowedModeValue, "off"); ?>><?php _e("Off", "wp-tracy"); ?></option>
                            <option value="on" <?php selected($panelsFilteringAllowedModeValue, "on"); ?>><?php _e("On", "wp-tracy"); ?></option>
                        </select>
                        <p id="wp-tracy-user-settings-panels-filtering-allowed-description" class="description"><?php _e("This option affects application of filter \"wp_tracy_panels_filter\".", "wp-tracy"); ?></p>
                    </td>
                </tr>
            </table>
            <?php submit_button(); ?>
        </form>
    </div>
    <?php
}

function wp_tracy_settings_get_value(array $values, $key, $filter, $defaultValue = null)
{
    return array_key_exists($key, $values) ? filter_var($values[$key], $filter) : $defaultValue;
}
