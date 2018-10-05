<?php

class KT_WPW_Reference_Config implements KT_Configable
{
    const FORM_PREFIX = "kt-wpw-reference";

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

    const PARAMS_FIELDSET = "kt-wpw-reference-params";
    const PARAMS_DATE = "kt-wpw-reference-params-date";
    const PARAMS_CLIENT = "kt-wpw-reference-params-client";
    const PARAMS_TYPES = "kt-wpw-reference-params-types";

    public static function getParamsFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::PARAMS_FIELDSET, __("Parametry", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::PARAMS_FIELDSET);

        $referenceTypes = new KT_WPW_Reference_Type_Enum();
        $referenceOptions = KT::arrayRemoveByKey($referenceTypes->getTranslates(), KT_WPW_Reference_Type_Enum::NONE);

        $fieldset->addText(self::PARAMS_DATE, __("Datum:", "WPW_DOMAIN"));

        $fieldset->addText(self::PARAMS_CLIENT, __("Klient:", "WPW_DOMAIN"));

        $fieldset->addCheckbox(self::PARAMS_TYPES, __("Typy:", "WPW_DOMAIN"))
            ->setOptionsData($referenceOptions);

        return $fieldset;
    }
}
