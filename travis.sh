#!/bin/bash
source /etc/profile.d/rvm.sh

echo "\$ git clone $3 git"
git clone $3 git
echo "\$ cd git"
cd git
echo "\$ git checkout $4"
git checkout $4

echo "\$ rvm use $1 --install --fuzzy"
rvm use $1 --install --fuzzy

echo "\$ gem install bundler"
gem install bundler

echo "\$ export PUPPET_GEM_VERSION=\"~> $2\""
export PUPPET_GEM_VERSION="~> $2"
echo "\$ export BUNDLE_GEMFILE=$PWD/Gemfile"
export BUNDLE_GEMFILE=$PWD/Gemfile

echo "\$ bundle install --jobs=3 --retry=3"
bundle install --jobs=3 --retry=3

command=$(cat .travis.yml | shyaml get-value script)

echo "\$ $command"
eval $command
