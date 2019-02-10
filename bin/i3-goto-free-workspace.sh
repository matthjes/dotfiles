#!/usr/bin/env bash

max_workspace=`i3-msg -t get_workspaces | jq -s '.[] | max_by(.num) | .num'`
i3-msg "workspace $(($max_workspace + 1))"