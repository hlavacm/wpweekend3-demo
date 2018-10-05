<?php

define("WP_TRACY_PROGRAMMATICALLY_DISABLED", true);
require("wp-load.php");

$deleter = new KT_WPW_Post_Deleter;
echo $deleter->delete();
