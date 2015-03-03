#!/bin/sh
APIKEY='5ac23d50211f458dcd3f542bba6971d6'

if [[ ! -d /srv/www/autoviemme/htdocs/wp-content ]]; then
    echo "Installing Autoviemme website..."
    wp core download
    wp core config
    #wp db create
    #wp core install

    #mysql -u root -proot autoviemme < autoviemme.sql 
    #wp search-replace autoviemme.it autoviemme.dev

    git clone git@bitbucket.org:drivek/dealerk-wp.git                  /srv/www/autoviemme/htdocs/wp-content/plugins/dealerk-wp
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-autoviemme.git /srv/www/autoviemme/htdocs/wp-content/themes/autoviemme
    git clone git@bitbucket.org:drivek/dealerk-wp-theme-canvas.git     /srv/www/autoviemme/htdocs/wp-content/themes/dealerk

    cp /srv/www/autoviemme/htdocs/wp-content/plugins/dealerk-wp/config/config-sample.php /srv/www/autoviemme/htdocs/wp-content/plugins/dealerk-wp/config/config.php

    #wp plugin activate dealerk-wp
    #wp theme activate autoviemme
    #
    #wp rewrite structure '/%postname%'
    #wp option update dealerk_options '{"theme": "time_theme", "apikey": "'${APIKEY}'"}' --format=json
else
    # Let the user know the good news
    echo "Autoviemme site now installed";
fi


