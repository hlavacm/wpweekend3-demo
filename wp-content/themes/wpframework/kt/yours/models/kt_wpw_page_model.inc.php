<?php

class KT_WPW_Page_Model extends KT_WP_Post_Base_Model
{
    function __construct(WP_Post $post)
    {
        parent::__construct($post, KT_WPW_Page_Config::FORM_PREFIX);
    }

    // --- getry & setry ------------------------

    // @todo
}
