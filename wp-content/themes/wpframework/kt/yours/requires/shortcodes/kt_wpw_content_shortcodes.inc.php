<?php

/*
 * Jednoduché řešení postaru, pro složitější scénáře viz @see KT_Shortcode
 */

add_shortcode("wpw_row_start", "kt_wpw_row_start_shortcode_callback");

function kt_wpw_row_start_shortcode_callback($atts)
{
    return "<div class=\"row contentColumns\">";
}

add_shortcode("wpw_row_end", "kt_wpw_row_end_shortcode_callback");

function kt_wpw_row_end_shortcode_callback($atts)
{
    return "</div>";
}

add_shortcode("wpw_column_start", "kt_wpw_column_start_shortcode_callback");

function kt_wpw_column_start_shortcode_callback($atts)
{
    return "<div class=\"col-sm-6\">";
}

add_shortcode("wpw_column_end", "kt_wpw_column_end_shortcode_callback");

function kt_wpw_column_end_shortcode_callback($atts)
{
    return "</div>";
}

add_shortcode("wpw_clearfix", "kt_wpw_clearfix_shortcode_callback");

function kt_wpw_clearfix_shortcode_callback()
{
    return "<div class=\"clearfix\"></div>";
}
