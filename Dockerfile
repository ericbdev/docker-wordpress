FROM wordpress:cli-2.4.0-php7.4

# Add WP-CLI 
# RUN curl -o wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
# chmod +x wp-cli.phar;\
# sudo mv wp-cli.phar /usr/local/bin/wp;\
# wp --info;

## Remove existing assets
# RUN rm -rf wp-content/plugins/${BUILD_PLUGIN} 
# RUN rm -rf wp-content/themes/${BUILD_THEME} 

COPY --chown=www-data:www-data ./src/database/${DATABASE_DUMP} /var/www/html/${DATABASE_DUMP}
COPY --chown=www-data:www-data wordpress-entrypoint.sh /var/www/html/wordpress-entrypoint.sh
COPY --chown=www-data:www-data .env /var/www/html/.env
# RUN chmod +x /var/www/html/wordpress-entrypoint.sh
# RUN ["chmod", "+x", "/var/www/html/wordpress-entrypoint.sh"]
# CMD ["ls", "-A", "/var/www/html/"]
# RUN /var/www/html/wordpress-entrypoint.sh
# CMD sudo /var/www/html/wordpress-entrypoint.sh

# CMD 

# WORKDIR /var/www/html
# RUN ls

# RUN wp db import --debug=true ${DATABASE_DUMP};\
# wp search-replace --allow-root '${WP_URL}:${WP_PORT}' '${WP_URL_IMPORT}'



## Remove existing assets
# RUN rm -rf wp-content/plugins/${BUILD_PLUGIN} 
# RUN rm -rf wp-content/themes/${BUILD_THEME} 
