#!/bin/bash

url=${1:-'https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression'}
path=${2:-$(pwd)}
docker run --rm -ti -v $path:/chart-url-table -w=/chart-url-table svanosselaer/chart-url-table-buildnode:latest bash -c "source ~/.bash_profile && source ~/.bashrc && ./bash/run.sh $url"
