<?php

// --- posts: archive & taxonomy/category ------------------------

add_action("wp_ajax_kt_wpw_load_more_posts", "kt_wpw_load_more_posts_callback");
add_action("wp_ajax_nopriv_kt_wpw_load_more_posts", "kt_wpw_load_more_posts_callback");

function kt_wpw_load_more_posts_callback()
{
    if (KT::arrayIssetAndNotEmpty($_REQUEST)) {
        $presenter = new KT_WPW_Posts_Presenter();
        die($presenter->getPostsOutput());
    }
    die(false);
}

// --- posts: pre_get_posts ------------------------

add_action("pre_get_posts", "kt_wph_posts_per_page", 1);

function kt_wph_posts_per_page($query)
{
    if (!is_admin() && $query->is_main_query()) {
        if (is_category() || is_post_type_archive(KT_WP_POST_KEY)) {
            $query->set("posts_per_page", 1); // at least a little "reduction" of performance requirements because of custom WP Query in KT_WPW_Posts_Presenter
        }
    }
}

// --- media: link & gallery ------------------------

add_filter("media_view_settings", "kt_wpw_media_view_settings_filter");

function kt_wpw_media_view_settings_filter($settings)
{
    $settings["galleryDefaults"]["link"] = "file";
    $settings["galleryDefaults"]["columns"] = 4;
    return $settings;
}

// --- dashboard: glance ------------------------

add_filter("dashboard_glance_items", "kt_wpw_dashboard_glance_items_filter");

function kt_wpw_dashboard_glance_items_filter(array $elements)
{
    $postTypes = [KT_WPW_REFERENCE_KEY, KT_WPW_SLIDER_KEY];
    foreach ($postTypes as $postType) {
        $counts = wp_count_posts($postType, "readable");
        $label = sprintf(__("%s: %d", "WPW_DOMAIN"), get_post_type_object($postType)->label, $counts->publish);
        $elements[] = "<a href=\"edit.php?post_type=$postType\">$label</a>";
    }
    return $elements;
}

// --- yoast: disable JSON+LD ------------------------

add_filter("wpseo_json_ld_output", "__return_empty_array", 99);
