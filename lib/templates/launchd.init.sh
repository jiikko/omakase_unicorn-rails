#!/bin/sh

export GEM_HOME={{gem_home}}
export PATH={{gem_home}}:{{bundle_path}}:{{ruby_path}}:/bin:/usr/bin:/bin:/usr/sbin
# export PATH=/Users/koji/sites/outing/vendor/bundler/ruby/2.1.0:/Users/koji/.rvm/rubies/ruby-2.1.0/bin:/Users/koji/.rvm/gems/ruby-2.1.0/bin:/bin:/usr/bin:/bin:/usr/sbin
bundle exec unicorn_rails -c /Users/koji/sites/outing/.project/unicorn.conf.rb -E development
