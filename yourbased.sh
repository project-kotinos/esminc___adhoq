#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata libfontconfig


#install phantomjs
rm -rf $PWD/travis_phantomjs; mkdir -p $PWD/travis_phantomjs
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -O $PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar -xvf $PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C $PWD/travis_phantomjs
PATH=$PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64/bin:$PATH
phantomjs --version


export RAILS_ENV=test
# before_install
gem update --system
gem install --force bundler -v 1.17.3
# install
bundle install --jobs=3 --retry=3
# before_script
bundle exec rake db:migrate
# script
rake
