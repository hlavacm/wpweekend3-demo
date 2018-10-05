<?php

class KT_WPW_Post_Presenter extends KT_WP_Post_Base_Presenter
{
    function __construct(KT_WPW_Post_Model $model)
    {
        parent::__construct($model);
    }

    // --- getry & setry ------------------------------

    /** @return KT_WPW_Post_Model */
    public function getModel()
    {
        return parent::getModel();
    }

    // --- veřejné metody ------------------------------

    // @todo
}
