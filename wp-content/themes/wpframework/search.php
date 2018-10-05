<?php get_header(); ?>

<main id="search" class="container">
    <div class="row">
        <div class="col-md-12">
            <header>
                <h1><?php _e("Výsledky vyhledávání", "WPW_DOMAIN"); ?></h1>
                <h2><?php _e("pro:", "WPW_DOMAIN"); ?> <?php echo KT::stringEscape(get_search_query(false)); ?></h2>
            </header>
            <?php if (have_posts()) { ?>
                <div class="row">
                    <?php
                    global $wp_query;
                    KT_Presenter_Base::theQueryLoops($wp_query, "search", KT_WPW_Posts_Presenter::getClearfixes());
                    ?>
                </div>
                <div id="pagination" class="pagination clearfix">
                    <?php echo KT::bootstrapPagination(); ?>
                </div>
                <?php
            } else {
                ?> 
                <div class="row">
                    <p><?php _e("K dispozici nejsou žádné příspěvky...", "WPW_DOMAIN"); ?></p>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</main>

<?php
get_footer();
