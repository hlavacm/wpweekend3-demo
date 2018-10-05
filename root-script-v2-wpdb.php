<?php

require("wp-load.php");

global $wpdb;
$postIds = $wpdb->get_col(
    $wpdb->prepare(
        "SELECT ID FROM {$wpdb->posts} WHERE post_type = '%s' AND post_status = 'publish' ORDER BY post_date DESC;",
        KT_WP_POST_KEY
    )
);
if (KT::arrayIssetAndNotEmpty($postIds)) {
    $posts = [];
    foreach ($postIds as $postId) {
        $posts[] = get_post($postId);
    }
    KT::pr($posts);
}
