<?php

class KT_WPW_Competitive_Advantage_Config
{
    const FORM_PREFIX = "kt-wpw-competitive-advantage";

    // --- fieldsets ---------------------------

    /**
     * Vrátí základní fieldset pro detail konkureční výhody na základě číselníku
     *
     * @author Martin Hlaváč
     * @link http://www.ktstudio.cz
     *
     * @param KT_WPW_Competitive_Advantage_Model $item
     * @return \KT_Form_Fieldset
     */
    public static function getDetailFieldset(KT_WPW_Competitive_Advantage_Model $item = null)
    {
        $fieldset = KT_Catalog_Base_Config::getCatalogBaseFieldset(self::FORM_PREFIX, self::FORM_PREFIX, __("Konkureční výhoda", "WPW_DOMAIN"), $item);
        $fieldset[KT_WPW_Competitive_Advantage_Model::CODE_COLUMN]->setLabel(__("CSS class:", "WPW_DOMAIN"));
        return $fieldset;
    }
}
