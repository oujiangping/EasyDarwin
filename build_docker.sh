#!/bin/bash
tar -cvf EasyDarwin.tar.gz ../EasyDarwin
tar -cvf www.tar.gz www
sudo docker build .
rm EasyDarwin.tar.gz
rm www.tar.gz

