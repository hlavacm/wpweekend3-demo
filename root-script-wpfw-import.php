<?php

define("WP_TRACY_PROGRAMMATICALLY_DISABLED", true);
require("wp-load.php");

$importer = new KT_WPW_Post_Importer;
KT::dd($importer->import());
