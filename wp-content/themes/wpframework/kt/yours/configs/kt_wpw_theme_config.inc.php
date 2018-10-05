<?php

class KT_WPW_Theme_Config implements KT_Configable
{
    const FORM_PREFIX = "kt-wpw-theme";

    // --- fieldsety ---------------------------

    public static function getAllGenericFieldsets()
    {
        return self::getAllNormalFieldsets() + self::getAllSideFieldsets();
    }

    public static function getAllNormalFieldsets()
    {
        return [
            self::ADDRESS_FIELDSET => self::getAddressFieldset(),
            self::CONTACT_FIELDSET => self::getContactFieldset(),
            self::SOCIAL_FIELDSET => self::getSocialFieldset(),
            self::ANALYTICS_FIELDSET => self::getAnalyticsFieldset(),
        ];
    }

    public static function getAllSideFieldsets()
    {
        return [
            self::CATEGORY_FIELDSET => self::getCategoryFieldset(),
            self::COMPETITIVE_ADVATAGES_FIELDSET => self::getCompetitiveAdvantagesFieldset(),
        ];
    }

    // --- KATEGORIE ------------------------

    const CATEGORY_FIELDSET = "kt-wpw-theme-category";
    const CATEGORY_NEWS_ID = "kt-wpw-theme-category-news-id";

    public static function getCategoryFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::CATEGORY_FIELDSET, __("Kategorie", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::CATEGORY_FIELDSET);

        $fieldset->addWpCategory(self::CATEGORY_NEWS_ID, __("Novinky:", "WPW_DOMAIN"));

        return $fieldset;
    }

    // --- KONKURENČNÍ VÝHODY ------------------------

    const COMPETITIVE_ADVATAGES_FIELDSET = "kt-wpw-theme-competitive-advantages";
    const COMPETITIVE_ADVATAGES_TITLE = "kt-wpw-theme-competitive-advantages-title";
    const COMPETITIVE_ADVATAGES_MAX_COUNT = "kt-wpw-theme-competitive-advantages-max-count";

    public static function getCompetitiveAdvantagesFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::COMPETITIVE_ADVATAGES_FIELDSET, __("Konkurenční výhody", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::COMPETITIVE_ADVATAGES_FIELDSET);

        $fieldset->addText(self::COMPETITIVE_ADVATAGES_TITLE, __("Nadpis:", "WPW_DOMAIN"));
        $fieldset->addSlider(self::COMPETITIVE_ADVATAGES_MAX_COUNT, __("Max. počet:", "WPW_DOMAIN"))
            ->setDefaultValue(3)
            ->setStep(3)
            ->setMinValue(0)
            ->setMaxValue(12);

        return $fieldset;
    }

    // --- ADRESA ------------------------

    const ADDRESS_FIELDSET = "kt-wpw-theme-address";
    const ADDRESS_TITLE = "kt-wpw-theme-address-title";
    const ADDRESS_STREET = "kt-wpw-theme-address-street";
    const ADDRESS_CITY = "kt-wpw-theme-address-city";
    const ADDRESS_ZIP = "kt-wpw-theme-address-zip";

    public static function getAddressFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::ADDRESS_FIELDSET, __("Adresa", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::ADDRESS_FIELDSET);

        $fieldset->addText(self::ADDRESS_TITLE, __("Titulek:", "WPW_DOMAIN"));
        $fieldset->addText(self::ADDRESS_STREET, __("Ulice:", "WPW_DOMAIN"));
        $fieldset->addText(self::ADDRESS_CITY, __("Město:", "WPW_DOMAIN"));
        $fieldset->addText(self::ADDRESS_ZIP, __("PSČ:", "WPW_DOMAIN"));

        return $fieldset;
    }

    // --- KONTAKTY ------------------------

    const CONTACT_FIELDSET = "kt-wpw-theme-contact";
    const CONTACT_PHONE = "kt-wpw-theme-contact-phone";
    const CONTACT_MOBILE = "kt-wpw-theme-contact-mobile";
    const CONTACT_EMAIL = "kt-wpw-theme-contact-email";

    public static function getContactFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::CONTACT_FIELDSET, __("Kontakty", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::CONTACT_FIELDSET);

        $fieldset->addText(self::CONTACT_PHONE, __("Telefon:", "WPW_DOMAIN"));
        $fieldset->addText(self::CONTACT_MOBILE, __("Mobil:", "WPW_DOMAIN"));
        $fieldset->addText(self::CONTACT_EMAIL, __("E-mail:", "WPW_DOMAIN"))
            ->setInputType(KT_Text_Field::INPUT_EMAIL)
            ->addRule(KT_Field_Validator::EMAIL, __("E-mail musí být ve správném tvaru", "WPW_DOMAIN"));

        return $fieldset;
    }

    // --- SOCIÁLNÍ SÍTĚ ------------------------

    const SOCIAL_FIELDSET = "kt-wpw-theme-social";
    const SOCIAL_FACEBOOK = "kt-wpw-theme-social-facebook";
    const SOCIAL_TWITTER = "kt-wpw-theme-social-twitter";
    const SOCIAL_GOOGLE_PLUS = "kt-wpw-theme-social-google-plus";
    const SOCIAL_YOUTUBE = "kt-wpw-theme-social-youtube";

    public static function getSocialFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::SOCIAL_FIELDSET, __("Sociální sítě", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::SOCIAL_FIELDSET);

        $fieldset->addText(self::SOCIAL_FACEBOOK, __("Facebook:", "WPW_DOMAIN"))
            ->setInputType(KT_Text_Field::INPUT_URL);
        $fieldset->addText(self::SOCIAL_TWITTER, __("Twitter", "WPW_DOMAIN"))
            ->setInputType(KT_Text_Field::INPUT_URL);
        $fieldset->addText(self::SOCIAL_GOOGLE_PLUS, __("Google+:", "WPW_DOMAIN"))
            ->setInputType(KT_Text_Field::INPUT_URL);
        $fieldset->addText(self::SOCIAL_YOUTUBE, __("YouTube:", "WPW_DOMAIN"))
            ->setInputType(KT_Text_Field::INPUT_URL);

        return $fieldset;
    }

    // --- ANALYTIKA ------------------------

    const ANALYTICS_FIELDSET = "kt-wpw-theme-analytics";
    const ANALYTICS_TRACKING_CODE = "kt-wpw-theme-analytics-tracking-code";
    const ANALYTICS_PIXEL_CODE = "kt-wpw-theme-analytics-pixel-code";

    public static function getAnalyticsFieldset()
    {
        $fieldset = new KT_Form_Fieldset(self::ANALYTICS_FIELDSET, __("Analytika", "WPW_DOMAIN"));
        $fieldset->setPostPrefix(self::ANALYTICS_FIELDSET);

        $fieldset->addTextarea(self::ANALYTICS_TRACKING_CODE, __("Měřící kód:", "WPW_DOMAIN"))
            ->setToolTip(__("Měřící kód(y) Google Tag Manager nebo Analytics, popř. Seznam", "WPW_DOMAIN"))
            ->setFilterSanitize(FILTER_DEFAULT);

        $fieldset->addTextarea(self::ANALYTICS_PIXEL_CODE, __("Pixel kód:", "WPW_DOMAIN"))
            ->setToolTip(__("Měřící (Facebook) Pixel kód(y) do hlavičky", "WPW_DOMAIN"))
            ->setFilterSanitize(FILTER_DEFAULT);

        return $fieldset;
    }
}
