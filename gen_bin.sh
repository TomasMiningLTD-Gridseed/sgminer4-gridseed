#!/bin/sh

# auto make binaries
echo 'Cleanup directory ....\r\n'
make clean
echo 'Fetch last commit ...\r\n'
git pull
echo 'Autogen from Git ...\r\n'
./autogen.sh
echo 'Configuring sgminer 4.2.1 GSD 1.4 ....\r\n'
./configure --enable-gridseed --with-system-libusb
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
