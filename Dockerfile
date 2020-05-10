# https://docs.docker.com/engine/reference/builder/
FROM wordpress:latest

# copy in site export
# - extract files
# - extract db?
# - load db into sql
#   - is a db a path to a file, or a file? different options 
# might be better to unpack into directory first, then load into container

# hahahaha! Ah of course, also need to do prod search and replace for blog.url
# - need to change prod url for local url in database

# i guess thats it?
