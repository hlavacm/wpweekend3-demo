<?php

class KT_WPW_Post_Importer
{
    const API_URL = "https://jsonplaceholder.typicode.com/posts";

    public function import(): array
    {
        $results = [];
        $data = file_get_contents(self::API_URL);
        $items = json_decode($data);
        if (KT::arrayIssetAndNotEmpty($items)) {
            foreach ($items as $item) {
                $postarr = [
                    "post_title" => wp_strip_all_tags($item->title),
                    "post_content" => $item->body,
                    "post_status" => "publish",
                    "post_author" => 1,
                ];
                $results[] = wp_insert_post($postarr);
            }
        }
        return $results;
    }
}