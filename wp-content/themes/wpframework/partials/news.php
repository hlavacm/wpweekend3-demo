<?php
if (KT_WPW::getThemeModel()->isCategoryNews()) {
    $newsPresenter = new KT_WPW_News_Presenter();
    ?>

    <section id="news">
        <header>
            <h2><?php echo KT_WPW::getThemeModel()->getCategoryNewsTitle(); ?></h2>
        </header>
        <div class="row">
            <?php $newsPresenter->thePosts(); ?>
        </div>
    </section>

    <?php
}
