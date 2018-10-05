<?php

$config = new KT_WP_Configurator();

$config->setDisplayLogo()
    ->setPostArchiveMenu()
    ->setAllowCookieStatement()
    ->setAllowSession();

$config->addThemeSupport(KT_WP_THEME_SUPPORT_POST_THUMBNAILS_KEY);

$config->addPostTypeSupport(KT_WP_POST_TYPE_SUPPORT_EXCERPT_KEY, [KT_WP_PAGE_KEY]);

$config->removePostTypeSupport(KT_WP_POST_TYPE_SUPPORT_THUMBNAIL_KEY, [KT_WP_PAGE_KEY]);

$config->setPostsArchiveSlug("blog");

$config->setExcerptText("...");

$config->pageRemover()
    ->removeComments()
    ->removeTools()
    ->removeSubPage("edit.php", "edit-tags.php")
    ->removeSubPage("edit.php", "edit-tags.php?taxonomy=post_tag")
    ->removeSubPage("themes.php", "theme-editor.php");

$config->metaboxRemover()
    ->removePostTagMetabox()
    ->removeMetabox("tagsdiv-news-type", KT_WP_POST_KEY, "normal")
    ->removeRevisionsMetabox();

// --- images ------------------------------

$config->addImageSize(KT_WPW_IMAGE_SIZE_SLIDER, 1200, 250, true);
$config->addImageSize(KT_WPW_IMAGE_SIZE_REFERENCE_GALLERY, 768, 480, true);

$config->setImagesLazyLoading(true)
    ->setImagesLinkClasses(true);

// --- styly ---------------------------

$config->assetsConfigurator()->addStyle(KT_MAGNIFIC_POPUP_STYLE)->setEnqueue();
$config->assetsConfigurator()->addStyle("kt-wpw-bootstrap-style", KT_WPW_CSS_URL . "/bootstrap.min.css")->setEnqueue();
$config->assetsConfigurator()->addStyle("kt-wpw-style", get_template_directory_uri() . "/style.css")
    ->setDeps([KT_MAGNIFIC_POPUP_STYLE], "kt-wpw-bootstrap-style")
    ->setEnqueue();

$config->assetsConfigurator()->addStyle("kt-wpw-font-open-sans", "http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,700,800&amp;subset=latin,latin-ext")->setEnqueue();

// --- scripty ------------------------------

$config->assetsConfigurator()
    ->addScript(KT_JQUERY_UNVEIL_SCRIPT)
    ->setInFooter(true)
    ->setEnqueue();
$config->assetsConfigurator()
    ->addScript(KT_MAGNIFIC_POPUP_SCRIPT)
    ->setInFooter(true)
    ->setEnqueue();
$config->assetsConfigurator()
    ->addScript("kt-wpw-bootstrap-script", KT_WPW_JS_URL . "/bootstrap.min.js")
    ->setInFooter(true)
    ->setEnqueue();
$config->assetsConfigurator()
    ->addScript("kt-wpw-functions-script", KT_WPW_JS_URL . "/kt-wpw-functions.min.js")
    ->setDeps([KT_WP_JQUERY_SCRIPT, KT_JQUERY_UNVEIL_SCRIPT, KT_MAGNIFIC_POPUP_SCRIPT], "kt-wpw-bootstrap-script")
    ->addLocalizationData("myAjax", ["ajaxurl" => admin_url("admin-ajax.php")])
    ->setInFooter(true)
    ->setEnqueue();

// --- menu ---------------------------

$config->addWpMenu(KT_WPW_NAVIGATION_MAIN_MENU, __("Menu v hlavičce", "WPW_DOMAIN"));

// --- sidebars ------------------------------

$config->addSidebar(KT_WPW_SIDEBAR_DEFAULT)
    ->setName(__("Default", "WPW_DOMAIN"))
    ->setDescription(__("Výchozí", "WPW_DOMAIN"))
    ->setBeforeWidget('<div id="%1$s" class="widget %2$s">')
    ->setAfterWidget("</div>");

// --- dashboard ------------------------------

$config->metaboxRemover()->clearWordpressDashboard(true)
    ->removeDashboardMetabox("icl_dashboard_widget")
    ->removeDashboardMetabox("wpseo-dashboard-overview");

// --- widgety ------------------------------

$config->widgetRemover()->removeAllSystemWidgets(true, true)
    ->removeWidget("bcn_widget");

// --- head ------------------------------

$config->headRemover()->removeRecommendSystemHeads();

// --- Stránka s theme options ------------------------------

$config->setThemeSettingsPage();

// --- incializace ------------------------------

$config->initialize();

// --- umístění jQuery pluginu do patičky ------------------------------

add_action("wp_enqueue_scripts", "kt_wpw_enqueue_jquery_in_footer");

function kt_wpw_enqueue_jquery_in_footer()
{
    wp_deregister_script("wp-embed");
    wp_deregister_script(KT_WP_JQUERY_SCRIPT);
    /*
     * V případě, že máte všechny skripty spojené do jednoho včetně (vlastní) jQuery, 
     * tak následující 2 řádky zakomentujte, WP jQuery už pak není třeba:
     */
    wp_register_script(KT_WP_JQUERY_SCRIPT, "/wp-includes/js/jquery/jquery.js", false, "", true);
    wp_enqueue_script(KT_WP_JQUERY_SCRIPT);
}
