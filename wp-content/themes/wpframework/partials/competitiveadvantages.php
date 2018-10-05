<?php $competitiveAdvantagesPresenter = new KT_WPW_Competitive_Advantages_Presenter(); ?>

<section id="competitive-advantages">
    <?php if (KT_WPW::getThemeModel()->isCompetitiveAdvantagesTitle()) { ?>
        <header>
            <h2><?php echo KT_WPW::getThemeModel()->getCompetitiveAdvantagesTitle(); ?></h2>
        </header>
    <?php } ?>
    <div class="row">
        <?php $competitiveAdvantagesPresenter->theItems(); ?>
    </div>
</section>
