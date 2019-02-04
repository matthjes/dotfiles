#!/bin/bash

# Install go
echo "Installing go..."
sudo pacman -S --needed --noconfirm go

export GOPATH=~/dev/go
export GOBIN=$GOPATH/bin

# Setup go
if [ ! -d $GOPATH  ]; then
  echo "Creating go directory ($GOPATH)..."
  mkdir -p $GOPATH
else
  echo "Go directory ($GOPATH) already present."
fi

# Install homemaker
echo "Installing homemaker..."
go get github.com/matthjes/homemaker
