#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# before_install
gem update --system
gem uninstall bundler -x
gem install --force bundler -v 1.17.3
# install
bundle install --jobs=3 --retry=3
# before_script
bundle exec rake db:migrate
# script
rake
