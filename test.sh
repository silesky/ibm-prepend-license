#!/bin/sh
setup() {
  rm -rf src-web
  mkdir -p src-web/thing/thing2
  echo 'xxx' >'src-web/thing/after.js'
  echo 'xxx' >'src-web/after.js'
  echo 'xxx' >'src-web/thing/thing2/after.scss'
  echo 'xxx' >'src-web/thing/thing2/after1.scss'
  echo '#!/usr/bin/env node' >  'src-web/cli.js'
  echo 'xxx'                 >> 'src-web/cli.js'
}

set -f # disable wildcard expansion
run_test() {
  header_path='header.config.js'
  file_path=$1
  #setup
  echo [FILES from $file_path]
  node index.js $file_path $header_path
  echo "------"
}

setup

run_test src-web/**/*.scss
echo 'quoted'
run_test "src-web/**/*.scss"

run_test src-web/**/*.js

run_test src-web/**/*
echo 'quoted'
run_test "src-web/**/*"

run_test src-web/thing/thing2/after1.scss
echo 'quoted'
run_test 'src-web/thing/thing2/after1.scss'
