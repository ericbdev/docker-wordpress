# https://docs.docker.com/engine/reference/builder/
FROM wordpress:5.4.2-php7.2-apache

COPY --chown=www-data:www-data html /var/www/html

## Remove existing assets
RUN rm -rf /var/www/html/wp-content/plugins/${BUILD_PLUGIN} 
RUN rm -rf /var/www/html/wp-content/themes/${BUILD_THEME} 

# copy in site export
# - extract files
# - extract db?
# - load db into sql
#   - is a db a path to a file, or a file? different options 
# might be better to unpack into directory first, then load into container

# hahahaha! Ah of course, also need to do prod search and replace for blog.url
# - need to change prod url for local url in database

# i guess thats it?
