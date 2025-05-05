#!/bin/bash

set -e

sudo apt install -y wget apt-transport-https software-properties-common -y

wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh -O /tmp/dotnet-install.sh

chmod +x /tmp/dotnet-install.sh

/tmp/dotnet-install.sh --channel 9.0

# MFT parser
wget https://download.ericzimmermanstools.com/net9/MFTECmd.zip -O /tmp/MFTECmd.zip
sudo unzip /tmp/MFTECmd.zip -d /opt/MFTEcmd

# Amcache parser
wget https://download.ericzimmermanstools.com/net9/AmcacheParser.zip -O /tmp/AmcacheParser.zip
sudo unzip /tmp/AmcacheParser.zip -d /opt/AmcacheParser

# Shimcache parser
wget https://download.ericzimmermanstools.com/net9/AppCompatCacheParser.zip -O /tmp/AppCompatCacheParser.zip
sudo unzip /tmp/AppCompatCacheParser.zip -d /opt/AppCompatCacheParser

# bstrings
wget https://download.ericzimmermanstools.com/net9/bstrings.zip -O /tmp/bstrings.zip
sudo unzip /tmp/bstrings.zip -d /opt/bstrings

# Evtx parser
wget https://download.ericzimmermanstools.com/net9/EvtxECmd.zip



