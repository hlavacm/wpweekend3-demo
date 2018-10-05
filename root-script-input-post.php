<?php

define("WP_TRACY_PROGRAMMATICALLY_DISABLED", true);
require("wp-load.php");

if (count($_POST) > 0) {
    $data = [];
    $postId = filter_input(INPUT_POST, "post-id", FILTER_SANITIZE_NUMBER_INT);
    if (KT::isIdFormat($postId)) {
        $post = get_post($postId);
        if (KT::issetAndNotEmpty($post)) {
            $data = [
                "title" => $post->post_title,
                "body" => $post->post_content,
            ];
        }
    }

    header("Content-Type: application/json");
    echo json_encode([
        "status" => KT::arrayIssetAndNotEmpty($data) ? "success" : "error",
        "data" => $data,
    ]);
}
