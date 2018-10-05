<?php

class KT_WPW_Post_Config implements KT_Configable
{
    const FORM_PREFIX = "kt-wpw-post";

    // --- fieldsety ---------------------------

    public static function getAllGenericFieldsets()
    {
        return self::getAllNormalFieldsets() + self::getAllSideFieldsets();
    }

    public static function getAllNormalFieldsets()
    {
        return [
            self::PARAMS_FIELDSET => self::getParamsFieldset(),
        ];
    }

    public static function getAllSideFieldsets()
    {
        return [];
    }

    // --- parametry ---------------------------

    const PARAMS_FIELDSET = "kt-wpw-post-params";

    public static function getParamsFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::PARAMS_FIELDSET, __("Parametry", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::PARAMS_FIELDSET);

        // @todo

        return $fieldset;
    }
}
