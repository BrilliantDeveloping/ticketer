#!/bin/bash

cd APPS/ticketer &&
bundle install &&
rake db:migrate db:seed &&
rails server
