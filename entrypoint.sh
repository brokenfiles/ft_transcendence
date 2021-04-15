#!/bin/bash
set -e

# fix rails bug
rm -f /myapp/tmp/pids/server.pid

# install dependencies
bundle install
yarn install

# create and migrate db
rails db:create
rails db:migrate
rails db:seed

# exec container main process
exec "$@"
