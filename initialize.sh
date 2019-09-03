#!/bin/bash

# Install go
echo "Installing go..."
sudo pacman -S --needed --noconfirm go

export GOPATH=~/.local/share/go
export GOBIN=$HOME/go/bin

# Setup go
if [ ! -d $GOPATH  ]; then
  echo "Creating go directory ($GOPATH)..."
  mkdir -p $GOPATH
else
  echo "Go directory ($GOPATH) already present."
fi

if [ ! -d $GOBIN  ]; then
  echo "Creating go bin directory ($GOBIN)..."
  mkdir -p $GOBIN
else
  echo "Go bin directory ($GOBIN) already present."
fi

# Install homemaker
echo "Installing homemaker..."
go get github.com/FooSoft/homemaker
