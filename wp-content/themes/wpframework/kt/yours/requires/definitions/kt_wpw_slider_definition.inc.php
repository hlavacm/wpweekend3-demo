<?php

add_action("init", "kt_wpw_register_slider_post_type");

function kt_wpw_register_slider_post_type()
{
    // --- post type ------------------------

    $labels = [
        "name" => __("Slidy", "WPW_DOMAIN"),
        "singular_name" => __("Slide", "WPW_DOMAIN"),
        "add_new" => __("Přidat slide", "WPW_DOMAIN"),
        "add_new_item" => __("Přidat nový slide", "WPW_DOMAIN"),
        "edit_item" => __("Změnit slide", "WPW_DOMAIN"),
        "new_item" => __("Nový slide", "WPW_DOMAIN"),
        "view_item" => __("Zobrazit slide", "WPW_DOMAIN"),
        "all_items" => __("Všechny slidy", "WPW_DOMAIN"),
        "search_items" => __("Hledat slidy", "WPW_DOMAIN"),
        "not_found" => __("Žádné slidy nenalezeny", "WPW_DOMAIN"),
        "not_found_in_trash" => __("Žádné slidy v koši", "WPW_DOMAIN"),
        "menu_name" => __("Slidy", "WPW_DOMAIN"),
    ];

    $args = [
        "labels" => $labels,
        "public" => false,
        "publicly_queryable" => false,
        "show_ui" => true,
        "show_in_menu" => true,
        "capability_type" => KT_WP_POST_KEY,
        "query_var" => true,
        "rewrite" => ["slug" => KT_WPW_SLIDER_SLUG, "with_front" => false],
        "has_archive" => false,
        "hierarchical" => false,
        "menu_position" => 4,
        "menu_icon" => "dashicons-images-alt",
        "supports" => [
            KT_WP_POST_TYPE_SUPPORT_TITLE_KEY,
            KT_WP_POST_TYPE_SUPPORT_THUMBNAIL_KEY,
            KT_WP_POST_TYPE_SUPPORT_EXCERPT_KEY,
            KT_WP_POST_TYPE_SUPPORT_PAGE_ATTRIBUTES_KEY,
        ],
    ];

    register_post_type(KT_WPW_SLIDER_KEY, $args);
}

// --- admin sloupce ---------------------------

if (is_admin()) { // vlastní sloupce v administraci
    $sliderColumns = new KT_Admin_Columns(KT_WPW_SLIDER_SLUG);
    $sliderColumns->addColumn("post_thumbnail", [
        KT_Admin_Columns::LABEL_PARAM_KEY => __("Foto", "WPW_DOMAIN"),
        KT_Admin_Columns::TYPE_PARAM_KEY => KT_Admin_Columns::THUMBNAIL_TYPE_KEY,
        KT_Admin_Columns::INDEX_PARAM_KEY => 0,
    ]);
    $sliderColumns->addColumn("menu_order", [
        KT_Admin_Columns::LABEL_PARAM_KEY => __("Pořadí", "WPW_DOMAIN"),
        KT_Admin_Columns::TYPE_PARAM_KEY => KT_Admin_Columns::POST_PROPERTY_TYPE_KEY,
        KT_Admin_Columns::PROPERTY_PARAM_KEY => "menu_order",
        KT_Admin_Columns::SORTABLE_PARAM_KEY => true,
        KT_Admin_Columns::INDEX_PARAM_KEY => 3,
    ]);
}
