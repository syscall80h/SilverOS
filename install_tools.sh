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
wget https://download.ericzimmermanstools.com/net9/EvtxECmd.zip -O /tmp/EvtxECmd.zip
sudo unzip /tmp/EvtxECmd.zip -d /opt/EvtxECmd

# EZViewer
wget https://download.ericzimmermanstools.com/net9/EZViewer.zip -O /tmp/EZViewer.zip
sudo unzip /tmp/EZViewer.zip -d /opt/EZViewer

# Jumplist parser
wget https://download.ericzimmermanstools.com/net9/JLECmd.zip -O /tmp/JLECmd.zip
sudo unzip /tmp/JLECmd.zip -d /opt/JLECmd

# Lnk parser
wget https://download.ericzimmermanstools.com/net9/LECmd.zip -O /tmp/LECmd.zip
sudo unzip /tmp/LECmd.zip -d /opt/LECmd

# MFTExplorer
wget https://download.ericzimmermanstools.com/net9/MFTExplorer.zip -O /tmp/MFTExplorer.zip
sudo unzip /tmp/MFTExplorer.zip -d /opt/MFTExplorer

# Prefetch parser
wget https://download.ericzimmermanstools.com/net9/PECmd.zip -O /tmp/PECmd.zip
sudo unzip /tmp/PECmd.zip -d /opt/PECmd

# RegistryExplorer
wget https://download.ericzimmermanstools.com/net9/RegistryExplorer.zip -O /tmp/RegistryExplorer.zip
sudo unzip /tmp/RegistryExplorer.zip -d /opt/RegistryExplorer

# ShellBagsExplorer
wget https://download.ericzimmermanstools.com/net9/ShellBagsExplorer.zip -O /tmp/ShellBagsExplorer.zip
sudo unzip /tmp/ShellBagsExplorer.zip -d /opt/ShellBagsExplorer

# TimelineExplorer
wget https://download.ericzimmermanstools.com/net9/TimelineExplorer.zip -O /tmp/TimelineExplorer.zip
sudo unzip /tmp/TimelineExplorer.zip -d /opt/TimelineExplorer

# Srum parser
wget https://download.ericzimmermanstools.com/net9/SrumECmd.zip -O /tmp/SrumECmd.zip
sudo unzip /tmp/SrumECmd.zip -d /opt/SrumECmd

# Shellbag parser
wget https://download.ericzimmermanstools.com/net9/SBECmd.zip -O /tmp/SBECmd.zip
sudo unzip /tmp/SBECmd.zip -d /opt/SBECmd




