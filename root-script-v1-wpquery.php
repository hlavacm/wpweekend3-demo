<?php

define("WP_USE_THEMES", false);
require("wp-blog-header.php");

$args = [
    "post_type" => KT_WP_POST_KEY,
    "post_status" => "publish",
    "posts_per_page" => -1,
    "orderby" => "date",
    "order" => KT_Repository::ORDER_DESC,
];

$query = new WP_Query();
$posts = $query->query($args);
if (KT::arrayIssetAndNotEmpty($posts)) {
    KT::dd($posts);
}