#!/usr/bin/env bash

sudo apt-get install -y meson ninja-build

meson setup build
meson compile -C build
