#!/bin/bash
tar -cvf EasyDarwin.tar.gz ../EasyDarwin
sudo docker build .
rm EasyDarwin.tar.gz

