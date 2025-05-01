#!/bin/bash

# Terminer les instances existantes
killall -q polybar

# Lancer Polybar
polybar mybar &
