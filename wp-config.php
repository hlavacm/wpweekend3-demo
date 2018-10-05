<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wpweekend3-demo');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', '127.0.0.1');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'X2F%; d3xWjgV03k&;ow40,W#~Q2^+Eeo)@6cq=d6TDs[il&O~>wP3V0sdh42c(c');
define('SECURE_AUTH_KEY',  'Lt.^|{A$dgPM72KsZ.?(ghhm5)uIeaBI#H*vmzpav|zHh:JIm4EwjdT%j75oOtIE');
define('LOGGED_IN_KEY',    '~fSHD$|z^QSk0bvoC:;+:h!,85O$[gi9D{um0/#)YZ.}tZk9+&YA63nUE[PzVuSF');
define('NONCE_KEY',        'ykVV)A(kI:.~4X{;&,tUtdRiMQIUc<F?W(*Yh;UGi*U>8H38 q~T8SCgG5WOO&Gk');
define('AUTH_SALT',        '?nHV{%b5iSLqX3t!4P>q6Spj^Zz?6W+ZRLV;76UtYYz6Xl>k^g@8^ Ihd54|c-t7');
define('SECURE_AUTH_SALT', '.[$>!^>B4:RYWNF0`S@(h!Vmq(1KPOj# +AQafG3GQ&P.v-i!vLl2LsVUKsI1DE/');
define('LOGGED_IN_SALT',   '@sWpnlF!R)G#~)l:h:f4/M-$3xFAG_@xqU4<}}13@HWu)q;wW,Sl/0Qo/9JYe:cA');
define('NONCE_SALT',       '|T}ZUNH~d+dkmOyrE)rxVv*of%Zuq1-W9d3,p%!Q^%xaGGo#/,&W+kG#_u*yBQ,R');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wpw_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

define('AUTOSAVE_INTERVAL', 300 ); // seconds
define('WP_POST_REVISIONS', false );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
