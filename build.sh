#!/bin/bash -e

gem install bundler
bundle install

rake db:migrate
redis-server