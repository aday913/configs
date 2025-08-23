#!/bin/bash

install_apt_packages(packages) {
    sudo apt-get update
    for package in "$@"; do
        if ! dpkg -s "$package" >/dev/null 2>&1; then
            sudo apt-get install -y "$package"
        else
            echo "$package is already installed."
        fi
    done
}

install_brew_packages(packages) {
    for package in "$@"; do
        if ! brew list "$package" >/dev/null 2>&1; then
            brew install "$package"
        else
            echo "$package is already installed."
        fi
    done

}

install_snap_packages(packages) {
    for package in "$@"; do
        if ! snap list "$package" >/dev/null 2>&1; then
            sudo snap install "$package"
        else
            echo "$package is already installed."
        fi
    done

}
