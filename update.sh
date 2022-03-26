#!/bin/bash

# Scripts for updating repo

BIN_FOLDER=/usr/bin
CONFIG_FOLDER=~/.config
REPO_CONFIG_FOLDER=./home/.config

rm -r ./home/.config
mkdir ./home/.config

cp ~/.bashrc ./home
cp ~/.vimrc ./home

cp $CONFIG_FOLDER/picom.conf $REPO_CONFIG_FOLDER/picom.conf
mkdir $REPO_CONFIG_FOLDER/alacritty && cp -r $CONFIG_FOLDER/alacritty $REPO_CONFIG_FOLDER/alacritty
mkdir $REPO_CONFIG_FOLDER/dunst && cp -r $CONFIG_FOLDER/dunst $REPO_CONFIG_FOLDER/dunst
mkdir $REPO_CONFIG_FOLDER/htop && cp -r $CONFIG_FOLDER/htop $REPO_CONFIG_FOLDER/htop
mkdir $REPO_CONFIG_FOLDER/i3 && cp -r $CONFIG_FOLDER/i3 $REPO_CONFIG_FOLDER/i3
mkdir $REPO_CONFIG_FOLDER/polybar && cp -r $CONFIG_FOLDER/polybar $REPO_CONFIG_FOLDER/polybar
mkdir $REPO_CONFIG_FOLDER/powerline && cp -r $CONFIG_FOLDER/powerline $REPO_CONFIG_FOLDER/powerline
mkdir $REPO_CONFIG_FOLDER/powerline-shell && cp -r $CONFIG_FOLDER/powerline-shell $REPO_CONFIG_FOLDER/powerline-shell
mkdir $REPO_CONFIG_FOLDER/ranger && cp -r $CONFIG_FOLDER/ranger $REPO_CONFIG_FOLDER/ranger
mkdir $REPO_CONFIG_FOLDER/rofi && cp -r $CONFIG_FOLDER/rofi $REPO_CONFIG_FOLDER/rofi

rm -rf ./scripts
mkdir ./scripts

cp $BIN_FOLDER/brightnesslevel.sh ./scripts
cp $BIN_FOLDER/check-network ./scripts
cp $BIN_FOLDER/check-vpn ./scripts
cp $BIN_FOLDER/rofr.sh ./scripts
cp $BIN_FOLDER/updates.sh ./scripts
cp $BIN_FOLDER/volumecontrol.sh ./scripts
cp $BIN_FOLDER/betterlockscreen ./scripts

