FROM wordpress:cli-2.4.0-php7.4

COPY --chown=www-data:www-data wait-for-it.sh /var/www/html/wait-for-it.sh 
COPY --chown=www-data:www-data wp-migrate.sh /var/www/html/wp-migrate.sh
COPY --chown=www-data:www-data .env /var/www/html/.env
COPY --chown=www-data:www-data ./src/database/${DATABASE_DUMP} /var/www/html/${DATABASE_DUMP}

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["/var/www/html/wait-for-it.sh wordpress_db:3306 -- /var/www/html/wp-migrate.sh"]
