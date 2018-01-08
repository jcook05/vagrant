#!/bin/bash


export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -yq --force-yes upgrade 

apt-get -y --force-yes install python-minimal 
