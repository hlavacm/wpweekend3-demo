<?php

require("wp-load.php");

$postId = filter_input(INPUT_GET, "post-id", FILTER_SANITIZE_NUMBER_INT);
if (KT::isIdFormat($postId)) {
    $post = get_post($postId);
    if (KT::issetAndNotEmpty($post)) {
        KT::dd($post);
    }
}
