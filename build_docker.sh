#!/bin/bash
tar -cvf EasyDarwin.tar.gz ../EasyDarwin
tar -cvf www.tar.gz www
sudo docker build -t oujiangping/easydarwin .
rm EasyDarwin.tar.gz
rm www.tar.gz

