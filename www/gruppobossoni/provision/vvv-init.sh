#!/bin/sh
APIKEY='5ac23d50211f458dcd3f542bba6971d6'

if [[ ! -d /srv/www/gruppobossoni/htdocs/wp-content ]]; then
    echo "Installing Gruppobossoni website..."
    wp core download
    wp core config
    #wp db create
    #wp core install

    #mysql -u root -proot gruppobossoni < gruppobossoni.sql 
    #wp search-replace gruppobossoni.it gruppobossoni.dev

    git clone git@bitbucket.org:drivek/dealerk-wp.git               /srv/www/gruppobossoni/htdocs/wp-content/plugins/dealerk-wp
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-bossoni.git /srv/www/gruppobossoni/htdocs/wp-content/themes/gruppobossoni
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-canvas.git  /srv/www/gruppobossoni/htdocs/wp-content/themes/dealerk

    cp /srv/www/gruppobossoni/htdocs/wp-content/plugins/dealerk-wp/config/config-sample.php /srv/www/gruppobossoni/htdocs/wp-content/plugins/dealerk-wp/config/config.php

    #wp plugin activate dealerk-wp
    #wp theme activate gruppobossoni
    #
    #wp rewrite structure '/%postname%'
    #wp option update dealerk_options '{"theme": "time_theme", "apikey": "'${APIKEY}'"}' --format=json
else
    # Let the user know the good news
    echo "Gruppo Bossoni site now installed";
fi


