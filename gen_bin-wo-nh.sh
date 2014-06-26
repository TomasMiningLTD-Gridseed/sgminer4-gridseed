#!/bin/sh

# auto make binaries
echo 'Cleanup directory ....\r\n'
make clean
echo 'Fetch last commit ...\r\n'
git pull
echo 'Switch version without nicehash extranonce patch ...\r\n'
echo 'Copying file ... \r\n'
cp version/miner-wo-nh.h miner.h
echo 'miner.h copied \r\n'
cp versio/sgminer-wo-nh.c sgminer.c
echo 'sgminer.c copied \r\n'
cp version/util-wo-nh.c util.c
echo ' util.c copied \r\n'
echo 'Autogen from Git ...\r\n'
./autogen.sh
echo 'Configuring sgminer 4.2.1 GSD 1.4 ....\r\n'
./configure --enable-gridseed
echo 'Making sgminer 4.2.1 GSD 1.4 ....\r\n'
make
if test -f sgminer
then
echo 'Verifying cgminer Version .....\r\n'
./sgminer --version
echo 'All is right .... Good mining :o) \r\n'
else
echo 'Making error try again :o) \r\n'
fi
