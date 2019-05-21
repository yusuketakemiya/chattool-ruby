#!/bin/sh
# set -e

# # Remove a potentially pre-existing server.pid for Rails.
# rm -f /app/tmp/pids/server.pid

# # Then exec the container's main process (what's set as CMD in the Dockerfile).
# exec "$@"

bundle exec rake db:create
bundle exec rake db:migrate
# bundle exec rake master:import
# bundle exec rake assets:precompile
