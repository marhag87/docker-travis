#!/bin/bash
source /etc/profile.d/rvm.sh

git clone $3 git
cd git
git checkout $4
echo rvm use $1 --install --fuzzy
rvm use $1 --install --fuzzy

gem install bundler

export PUPPET_GEM_VERSION="~> $2"
echo $PUPPET_GEM_VERSION
export BUNDLE_GEMFILE=$PWD/Gemfile
echo $BUNDLE_GEMFILE

bundle install --jobs=3 --retry=3

command=$(cat .travis.yml | shyaml get-value script)

echo $command
eval $command
