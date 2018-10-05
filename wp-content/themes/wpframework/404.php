<?php get_header(); ?>

<div class="container">
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <main id="error404">
                <header>
                    <h1><?php _e("Error - 404", "WPW_DOMAIN"); ?></h1>
                    <p><?php _e("Je nám líto, ale požadovaná adresa na webu neexistuje. Byla buď smazána nebo přesunuta na jinou adresu.", "WPW_DOMAIN"); ?></p>
                </header>
                <p><?php _e("Nenašli jste co jste hledali? Pokračujte na úvodní stránku.", "WPW_DOMAIN"); ?></p>
                <a href="<?php echo get_home_url(); ?>" title="<?php _e("Úvodní stránka", "WPW_DOMAIN"); ?>" class="btn btn-default"><?php _e("Úvodní stránka", "WPW_DOMAIN"); ?></a>
            </main>
        </div>
    </div>
</div>

<?php
get_footer();
