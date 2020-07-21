#!/bin/bash

url=${1:-'https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression'}

ruby --version &&

bundle install &&

rake run[$url]
