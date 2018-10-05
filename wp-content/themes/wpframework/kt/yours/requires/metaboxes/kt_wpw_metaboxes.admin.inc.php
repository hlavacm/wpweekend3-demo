<?php

// --- theme ------------------------

KT_MetaBox::createMultiple(KT_WPW_Theme_Config::getAllNormalFieldsets(), KT_WP_Configurator::getThemeSettingSlug(), KT_MetaBox_Data_Type_Enum::OPTIONS);

$themeSideMetaboxes = KT_MetaBox::createMultiple(KT_WPW_Theme_Config::getAllSideFieldsets(), KT_WP_Configurator::getThemeSettingSlug(), KT_MetaBox_Data_Type_Enum::OPTIONS, false);
foreach ($themeSideMetaboxes as $themeSideMetabox) {
    $themeSideMetabox->setContext(KT_MetaBox::CONTEXT_SIDE);
    $themeSideMetabox->register();
}

// --- post ------------------------

KT_MetaBox::createMultiple(KT_WPW_Post_Config::getAllGenericFieldsets(), KT_WP_POST_KEY, KT_MetaBox_Data_Type_Enum::POST_META);

// --- page ------------------------

KT_MetaBox::createMultiple(KT_WPW_Page_Config::getAllGenericFieldsets(), KT_WP_PAGE_KEY, KT_MetaBox_Data_Type_Enum::POST_META);

// --- reference ------------------------

KT_MetaBox::createMultiple(KT_WPW_Reference_Config::getAllGenericFieldsets(), KT_WPW_REFERENCE_KEY, KT_MetaBox_Data_Type_Enum::POST_META);

// --- competitive advantage ------------------------

KT_Metabox::createCrud(
    KT_WPW_Competitive_Advantage_Config::getDetailFieldset(), KT_Custom_Metaboxes_Page::getCustomMetaboxPageScreenName(KT_WPW_Competitive_Advantage_Model::PREFIX), "KT_WPW_Competitive_Advantage_Model", KT_WPW_Competitive_Advantage_Model::ID_COLUMN
);

// --- content ------------------------

foreach (array(KT_WP_POST_KEY, KT_WP_PAGE_KEY) as $postType) {
    $pageShortcodesMetabox = KT_MetaBox::createCustom("kt-wpw-$postType-shortcodes-metabox", __("Obsahové zktratky", "WPW_DOMAIN"), $postType, "kt_wpw_content_shortcodes_metabox_callback", false);
    $pageShortcodesMetabox->setContext(KT_MetaBox::CONTEXT_SIDE);
    $pageShortcodesMetabox->setPriority(KT_MetaBox::PRIORITY_LOW);
    $pageShortcodesMetabox->register();
}

function kt_wpw_content_shortcodes_metabox_callback()
{
    echo "<ol>";
    echo "<li><b>[wpw_row_start]</b> - <i>začátek řádku</i></li>";
    echo "<li><b>[wpw_column_start]</b> - <i>začátek sloupce</i></li>";
    echo "<li><b>[wpw_column_end]</b> - <i>konec sloupce</i></li>";
    echo "<li><b>[wpw_row_end]</b> - <i>konec řádku</i></li>";
    echo "<li><b>[wpw_clearfix]</b> - <i>reset rendrování UI</i></li>";
    echo "</ol>";
}
