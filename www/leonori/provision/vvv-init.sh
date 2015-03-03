#!/bin/sh
APIKEY='5ac23d50211f458dcd3f542bba6971d6'

if [[ ! -d /srv/www/leonori/htdocs/wp-content ]]; then
    echo "Installing Leonori website..."
    wp core download
    wp core config
    #wp db create
    #wp core install

    #mysql -u root -proot leonori < leonori.sql 
    #wp search-replace leonori.it leonori.dev

    git clone git@bitbucket.org:drivek/dealerk-wp.git               /srv/www/leonori/htdocs/wp-content/plugins/dealerk-wp
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-leonori.git /srv/www/leonori/htdocs/wp-content/themes/leonori
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-canvas.git  /srv/www/leonori/htdocs/wp-content/themes/dealerk

    cp /srv/www/leonori/htdocs/wp-content/plugins/dealerk-wp/config/config-sample.php /srv/www/leonori/htdocs/wp-content/plugins/dealerk-wp/config/config.php

    #wp plugin activate dealerk-wp
    #wp theme activate leonori
    #
    #wp rewrite structure '/%postname%'
    #wp option update dealerk_options '{"theme": "time_theme", "apikey": "'${APIKEY}'"}' --format=json
else
    # Let the user know the good news
    echo "Leonori site now installed";
fi


