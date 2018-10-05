<?php

final class KT_WPW_Reference_Type_Enum extends KT_Enum
{
    const NONE = 0;
    const WEBDESIGN = 1;
    const ANALYSIS = 2;
    const PROGRAMMING = 3;

    function __construct($value = null)
    {
        parent::__construct($value ?: self::NONE);
        $translates = [];
        $translates[self::NONE] = KT_EMPTY_SYMBOL;
        $translates[self::WEBDESIGN] = __("Webdesign", "WPW_DOMAIN");
        $translates[self::ANALYSIS] = __("Analýza", "WPW_DOMAIN");
        $translates[self::PROGRAMMING] = __("Programování", "WPW_DOMAIN");
        $this->setTranslates($translates);
    }
}
