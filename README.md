# README

# web_app_base
* Create Users 
* Assign roles to Users
* Authenticate with Warden
* Manage policies with Pundit
* Manage services with U-Case

## Install steps

From root:

Build the image
* ./run.sh build

Prepare the database (./run.sh db help)
* ./run.sh db prepare

Boot the app (./run.sh dev help)
* ./run.sh dev server

Run specs (./run.sh test help)
* ./run.sh test

Run lints (rubocop -a && reek)
* ./run.sh lint

Run rubocop
* ./run.sh lint rubocop

Run reek
* ./run.sh lint reek

Things you may want to cover:

* Ruby version ruby-2.6.6

* System dependencies
  - docker
  - docker-compose


## Debug with pry

* Steps:

- Add 'binding.pry' in the breakpoint you want to set
- Run app
- Get container id with '$ docker ps' or '$ ctop'
- Attach to the container with it's id '$ docker attach container_id'

Things you may want to cover:

* Ruby version 2.7.1

* System dependencies
  - docker
  - docker-compose
