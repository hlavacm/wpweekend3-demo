<?php
if (function_exists("yoast_breadcrumb")) {
    ?>

    <div class="container">
        <ol class="breadcrumb hidden-xs">
            <li><?php _e("Nacházíte se:", "WPW_DOMAIN"); ?></li>
            <?php yoast_breadcrumb(); ?>
        </ol>
    </div>

    <?php
}