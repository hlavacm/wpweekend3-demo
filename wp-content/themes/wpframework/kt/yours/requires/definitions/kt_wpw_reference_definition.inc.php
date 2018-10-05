<?php

// --- post type ------------------------

add_action("init", "kt_wpw_register_reference_post_type");

function kt_wpw_register_reference_post_type()
{
    $labels = [
        "name" => __("Reference", "WPW_DOMAIN"),
        "singular_name" => __("Reference", "WPW_DOMAIN"),
        "menu_name" => __("Reference", "WPW_DOMAIN"),
        "name_admin_bar" => __("Reference", "WPW_DOMAIN"),
        "archives" => __("Archív referencí", "WPW_DOMAIN"),
        "attributes" => __("Atributy", "WPW_DOMAIN"),
        "parent_item_colon" => __("Nadřazená reference", "WPW_DOMAIN"),
        "all_items" => __("Všechny reference", "WPW_DOMAIN"),
        "add_new_item" => __("Přidat novou referenci", "WPW_DOMAIN"),
        "add_new" => __("Přidat novou", "WPW_DOMAIN"),
        "new_item" => __("Přidat referenci", "WPW_DOMAIN"),
        "edit_item" => __("Upravit referenci", "WPW_DOMAIN"),
        "update_item" => __("Aktualizovat referenci", "WPW_DOMAIN"),
        "view_item" => __("Zobrazit referenci", "WPW_DOMAIN"),
        "view_items" => __("Zobrazit reference", "WPW_DOMAIN"),
        "search_items" => __("Hledat reference", "WPW_DOMAIN"),
        "not_found" => __("Nenalezeno", "WPW_DOMAIN"),
        "not_found_in_trash" => __("Nenalezeno v koši", "WPW_DOMAIN"),
        "featured_image" => __("Obrázek", "WPW_DOMAIN"),
        "set_featured_image" => __("Zvolit obrázek", "WPW_DOMAIN"),
        "remove_featured_image" => __("Odstranit obrázek", "WPW_DOMAIN"),
        "use_featured_image" => __("Zvolit obrázek", "WPW_DOMAIN"),
        "insert_into_item" => __("Vložit k referenci", "WPW_DOMAIN"),
        "uploaded_to_this_item" => __("Nahrát k referenci", "WPW_DOMAIN"),
        "items_list" => __("Seznam referencí", "WPW_DOMAIN"),
        "items_list_navigation" => __("Seznam referencí menu", "WPW_DOMAIN"),
        "filter_items_list" => __("Filtrovat reference", "WPW_DOMAIN"),
    ];
    $args = [
        "label" => __("Reference", "WPW_DOMAIN"),
        "description" => __("Entita reference", "WPW_DOMAIN"),
        "labels" => $labels,
        "public" => true,
        "publicly_queryable" => true,
        "show_ui" => true,
        "show_in_menu" => true,
        "capability_type" => KT_WP_POST_KEY,
        "query_var" => true,
        "rewrite" => ["slug" => KT_WPW_REFERENCE_SLUG, "with_front" => false],
        "has_archive" => KT_WPW_REFERENCES_SLUG,
        "hierarchical" => false,
        "menu_position" => 4,
        "menu_icon" => "dashicons-portfolio",
        "supports" => [
            KT_WP_POST_TYPE_SUPPORT_TITLE_KEY,
            KT_WP_POST_TYPE_SUPPORT_EDITOR_KEY,
            KT_WP_POST_TYPE_SUPPORT_THUMBNAIL_KEY,
            KT_WP_POST_TYPE_SUPPORT_EXCERPT_KEY,
            KT_WP_POST_TYPE_SUPPORT_PAGE_ATTRIBUTES_KEY,
        ],
    ];
    register_post_type(KT_WPW_REFERENCE_KEY, $args);
}

// --- taxonomie ---------------------------

add_action("init", "kt_wpw_register_reference_taxonomy");

function kt_wpw_register_reference_taxonomy()
{
    $labels = [
        "name" => __("Kategorie", "WPW_DOMAIN"),
        "singular_name" => __("Kategorie", "WPW_DOMAIN"),
        "menu_name" => __("Kategorie", "WPW_DOMAIN"),
        "all_items" => __("Všechny kategorie", "WPW_DOMAIN"),
        "parent_item" => __("Nadřazená kategorie", "WPW_DOMAIN"),
        "parent_item_colon" => __("Nadřazená kategorie:", "WPW_DOMAIN"),
        "new_item_name" => __("Nová kategorie", "WPW_DOMAIN"),
        "add_new_item" => __("Přidat novou kategorii", "WPW_DOMAIN"),
        "edit_item" => __("Upravit kategorii", "WPW_DOMAIN"),
        "update_item" => __("Aktualizovat kategorii", "WPW_DOMAIN"),
        "view_item" => __("Zobrazit kategorii", "WPW_DOMAIN"),
        "separate_items_with_commas" => __("Oddělte kategorie čárkami", "WPW_DOMAIN"),
        "add_or_remove_items" => __("Přidat nebo odebrat kategorie", "WPW_DOMAIN"),
        "choose_from_most_used" => __("Vybrat z nejpouživanějších", "WPW_DOMAIN"),
        "popular_items" => __("Populární kategorie", "WPW_DOMAIN"),
        "search_items" => __("Hledat kategorie", "WPW_DOMAIN"),
        "not_found" => __("Nenalezeno", "WPW_DOMAIN"),
        "no_terms" => __("Žádné kategorie", "WPW_DOMAIN"),
        "items_list" => __("Seznam kategorií", "WPW_DOMAIN"),
        "items_list_navigation" => __("Seznam kategorií menu", "WPW_DOMAIN"),
    ];
    $args = [
        "labels" => $labels,
        "hierarchical" => true,
        "public" => false,
        "show_ui" => true,
        "show_admin_column" => true,
        "show_in_nav_menus" => true,
        "show_tagcloud" => false,
        "rewrite" => [
            "slug" => KT_WPW_REFERENCE_CATEGORY_SLUG,
            "with_front" => true,
            "hierarchical" => false,
        ],
    ];
    register_taxonomy(KT_WPW_REFERENCE_CATEGORY_KEY, [KT_WPW_REFERENCE_KEY], $args);
}

// --- admin sloupce ---------------------------

if (is_admin()) { // vlastní sloupce v administraci
    $referenceAdminColumns = new KT_Admin_Columns(KT_WPW_REFERENCE_KEY);
    $referenceAdminColumns->addColumn("post_thumbnail", [
        KT_Admin_Columns::LABEL_PARAM_KEY => __("Foto", "WPW_DOMAIN"),
        KT_Admin_Columns::TYPE_PARAM_KEY => KT_Admin_Columns::THUMBNAIL_TYPE_KEY,
        KT_Admin_Columns::INDEX_PARAM_KEY => 0,
    ]);
    $referenceAdminColumns->addColumn(KT_WPW_Reference_Config::PARAMS_DATE, [
        KT_Admin_Columns::LABEL_PARAM_KEY => __("Datum", "WPW_DOMAIN"),
        KT_Admin_Columns::TYPE_PARAM_KEY => KT_Admin_Columns::POST_META_TYPE_KEY,
        KT_Admin_Columns::METAKEY_PARAM_KEY => KT_WPW_Reference_Config::PARAMS_DATE,
        KT_Admin_Columns::SORTABLE_PARAM_KEY => true,
        KT_Admin_Columns::INDEX_PARAM_KEY => 3,
    ]);
    $referenceAdminColumns->addColumn(KT_WPW_Reference_Config::PARAMS_CLIENT, [
        KT_Admin_Columns::LABEL_PARAM_KEY => __("Klient", "WPW_DOMAIN"),
        KT_Admin_Columns::TYPE_PARAM_KEY => KT_Admin_Columns::POST_META_TYPE_KEY,
        KT_Admin_Columns::METAKEY_PARAM_KEY => KT_WPW_Reference_Config::PARAMS_CLIENT,
        KT_Admin_Columns::ORDERBY_PARAM_KEY => KT_Admin_Columns::METAKEY_VALUE_NUM_KEY,
        KT_Admin_Columns::SORTABLE_PARAM_KEY => true,
        KT_Admin_Columns::INDEX_PARAM_KEY => 4,
    ]);
}
