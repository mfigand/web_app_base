# README

# web_app_base

## Install steps

From root:

Build the image
* docker-compose build

Create the database.
* docker-compose run web rake db:create

Boot the app
* docker-compose up

Run specs
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rspec

Run rubocop
(--rm tell Docker daemon that once its done running, erase everything related to it and save the disk space)
* docker-compose run --rm web rubocop

Things you may want to cover:

* Ruby version 2.5

* System dependencies
  - docker
  - docker-compose
