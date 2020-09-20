FROM wordpress:cli-2.4.0-php7.4

# Add WP-CLI 
# RUN curl -o wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
# chmod +x wp-cli.phar;\
# sudo mv wp-cli.phar /usr/local/bin/wp;\
# wp --info;

## Remove existing assets
# RUN rm -rf wp-content/plugins/${BUILD_PLUGIN} 
# RUN rm -rf wp-content/themes/${BUILD_THEME} 

# Add wait-for-it
# // RUN chmod +x wait-for-it.sh

COPY --chown=www-data:www-data wait-for-it.sh wait-for-it.sh 
COPY --chown=www-data:www-data wp-engine-migrate.sh wp-engine-migrate.sh
COPY --chown=www-data:www-data .env /var/www/html/.env
COPY --chown=www-data:www-data ./src/database/${DATABASE_DUMP} /var/www/html/${DATABASE_DUMP}

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["./wait-for-it.sh" , "mysql:3306" , "--strict" , "--timeout=300" , "--" , "./wp-engine-migrate.sh"]


# RUN chmod +x /var/www/html/wp-engine-migrate.sh
# RUN ["chmod", "+x", "/var/www/html/wp-engine-migrate.sh"]
# CMD ["ls", "-A", "/var/www/html/"]
# RUN /var/www/html/wp-engine-migrate.sh
# CMD sudo /var/www/html/wp-engine-migrate.sh

# CMD 

# WORKDIR /var/www/html
# RUN ls

# RUN wp db import --debug=true ${DATABASE_DUMP};\
# wp search-replace --allow-root '${WP_URL}:${WP_PORT}' '${WP_URL_IMPORT}'



## Remove existing assets
# RUN rm -rf wp-content/plugins/${BUILD_PLUGIN} 
# RUN rm -rf wp-content/themes/${BUILD_THEME} 
