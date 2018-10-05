<?php

class KT_WPW_Post_Deleter
{
    public function delete(): int
    {
        global $wpdb;
        $result = $wpdb->query(
            $wpdb->prepare(
                "DELETE FROM {$wpdb->posts} WHERE post_type = '%s' AND ID > 2;", KT_WP_POST_KEY
            )
        );
        return $result;
    }
}