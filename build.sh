#!/bin/bash

echo 'Setup database'
bundle exec rails db:setup;
bundle exec rails db:seed;

echo 'Intall yarn dependencies'
yarn install;
