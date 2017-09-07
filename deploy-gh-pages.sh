#!/bin/bash
echo "mottoto.press" > ./dist/CNAME
yarn build:prod && gh-pages -d ./dist
