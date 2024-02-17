#!/bin/bash

#################################
##  user editable config here  ##
#################################

ALGO=verus
POOL=url-pool
WALLET=alamat-wallet
PASS=x
THREAD=2

#########################
##   download config   ##
#########################

APT="git wget nano autoconf automake autotools-dev build-essential libuv1-dev libhwloc-dev m4 make libssl-dev libcurl4-openssl-dev libtool"
URL="--single-branch -b Linux-x86_64 https://github.com/maribun20/cc-miner"
DIR=cc-miner


#########################
##      Download       ##
#########################

apt install $APT
git clone $URL
cd $DIR
./autogen.sh
./configure
make -j


#########################
##       miner cfg     ##
#########################

./ccminer -a $ALGO -o $POOL -u $WALLET -t $THREAD -p $PASS
