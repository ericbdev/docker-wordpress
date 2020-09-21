#!/bin/bash
WPPLUGINS=( cmb2 advanced-gutenberg-blocks ultimate-addons-for-gutenberg async-javascript )

# Load all .env vars into script
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

wp --info
wp core download # --version=5.1.1

if [ -f wp-config.php ]; then
  # cp wp-config-sample.php wp-config.php
  echo "has wp-config.php"
  # rm wp-config.php
else
  cp wp-config-sample.php wp-config.php
  echo "No wp-config.php"
fi

wp config create --debug=true --dbhost="wordpress_db:3306" --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USER" --dbpass="$WP_DB_PASS"

wp db create
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"

# Remove default plugins, install plugins, install Base Theme
# wp plugin delete --all
# wp plugin install ${WPPLUGINS[@]} --activate

# wp db import --debug=true ${DATABASE_DUMP};
# wp search-replace --allow-root '${WP_URL}:${WP_PORT}' '${WP_URL_IMPORT}'
