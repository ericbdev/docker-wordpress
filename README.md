# Docker for WordPress
- a webpack and docker stack for wordpress development and automation. built towards 
  matching production enviornment to local environment

## TODO:
- [x] use dockerfile to build wordpress
- [ ] specify wp verison
- [ ] copy in html on build
- [ ] load in database
- [ ] add in webpack automation for FED

## TLDR
- `docker-compose`
    - https://docs.docker.com/compose/install/
- if linux
    - + `docker engine`, do this first https://docs.docker.com/engine/install/
    - and just follow the instructions. 
- Check docker compose

## commands
- `wp:build` - This runs `docker-compose up`
    -  pulls the needed Docker images, and starts the wordpress and database containers
    - then maps in additional volumes

## Hierarchy
## have external files to map in?
`build/html` -> `var/www/html/`

- add in files in a 1:1 directory map to match production layer, as needed
- any files in this directory should not be added to the git index

## content / database
`build/database/database.sql`

## all plugin related files non theme functionality
`src/plugin/` -> `build/middleware` -> `var/html/wp-content/plugins/{plugin-name}`

## all theme files
`src/theme/` -> `build/theme` -> `var/html/wp-content/themes/{theme-name}`
src/theme/scripts
src/theme/styles
src/theme/templates - all php lives here, as 'wp-theme' root

## docker volumes
build/middleware -> `/wp-content/plugins/{plugin-name}`
build/theme -> `/wp-content/themes/{theme-name}/`

## Docker
### Install and use Docker on Ubuntu without sudo
- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
- https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15
- https://jtreminio.com/blog/running-docker-containers-as-current-host-user/

- https://docs.docker.com/engine/install/ubuntu/
    - for best bet, use debs available for your distro
- `systemctl --user (start|stop|restart) docker`
    - `sudo systemctl stop docker`
    - `systemctl --user start docker` - start dockerd with your user

- https://docs.docker.com/engine/install/linux-postinstall/
    - Create the docker group.
- `$ sudo groupadd docker`
    - Add your user to the docker group.
- `$ sudo usermod -aG docker $USER`

### Install and use docker-compose
- We could use a little bash to set that variable and start docker-compose:
    - `CURRENT_UID=$(id -u):$(id -g) docker-compose up`
    - Et voila! Our Dockerised script will create files as if it were the host user!
- https://docs.docker.com/compose/install/

### DELETE EVERYTHING BECAUSE AGRO
https://askubuntu.com/questions/935569/how-to-completely-uninstall-docker

## trouble shooting
-  `Couldn't connect to Docker daemon at http+docker://localhost - is it running?` 
    - `sudo dockerd` -> this is a sign that `dockerd` is not on the same user group as command
- `failed to start daemon: pid file found, ensure docker is not running or delete /var/run/docker.pid`
    - `$ systemctl status docker`, if it is running `$ systemctl stop docker`
    - still having problems? You mgiht need to `sudo docker-compose up`
    - could be that `export DOCKER_HOST=127.0.0.1` is needed in your env
- `$ sudo chmod +x /usr/local/bin/docker-compose` -> set docker compose read/write/execute

## additional resosurces
https://github.com/jaredpalmer/presspack
https://github.com/kitsunekyo/wordpress-theme-webpack-docker
https://medium.com/@zhao.li/how-to-understand-building-images-with-docker-compose-24cbdbc0641f
https://github.com/wagoodman/dive
https://docs.docker.com/compose/environment-variables/#the-env-file

https://github.com/ericbdev/docker-wordpress
https://www.smashingmagazine.com/2019/03/composer-wordpress/
https://vsupalov.com/docker-env-vars/
