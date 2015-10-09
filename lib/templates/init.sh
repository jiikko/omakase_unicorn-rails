#!/bin/sh

export GEM_HOME={{gem_home}}
bundle exec unicorn_rails -c /Users/koji/sites/outing/.project/unicorn.conf.rb -E development
