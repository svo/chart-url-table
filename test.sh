#!/bin/bash

path=${1:-$(pwd)}
docker run --rm -ti -v $path:/chart-url-table -w=/chart-url-table svanosselaer/chart-url-table-buildnode:latest bash -c "source ~/.bash_profile && source ~/.bashrc && ./bash/test.sh"
