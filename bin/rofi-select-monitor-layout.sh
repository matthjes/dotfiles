#!/bin/env bash
# adapted from https://github.com/carnager/rofi-scripts/blob/master/monitor_layout.sh

XRANDR=$(which xrandr)

MONITORS=( $( ${XRANDR} | awk '( $2 == "connected" ){ print $1 }' ) )

NUM_MONITORS=${#MONITORS[@]}

TITLES=()
COMMANDS=()

function get_mapping() {
  if [[ -f $HOME/bin/output-mapping.txt ]]; then
    awk -v input="$1" '($1 == input){print $2}' $HOME/bin/output-mapping.txt
  else
    echo $1
  fi
}

function gen_xrandr_only() {
  selected=$1

  cmd="xrandr --output ${MONITORS[$selected]} --auto "

  for entry in $(seq 0 $((${NUM_MONITORS}-1))); do
    if [ $selected != $entry ]; then
      cmd="$cmd --output ${MONITORS[$entry]} --off"
    fi
  done

  echo $cmd
}

declare -i index=0
TITLES[$index]="Cancel"
COMMANDS[$index]="true"
index+=1

for entry in $(seq 0 $((${NUM_MONITORS}-1))); do
  TITLES[$index]="Only $(get_mapping ${MONITORS[$entry]})"
  COMMANDS[$index]=$(gen_xrandr_only $entry)
  index+=1
done

##
# Dual screen options
##
for entry_a in $(seq 0 $((${NUM_MONITORS}-1))); do
  for entry_b in $(seq 0 $((${NUM_MONITORS}-1))); do
    if [ $entry_a != $entry_b ]; then
      TITLES[$index]="Dual: $(get_mapping ${MONITORS[$entry_a]}) + $(get_mapping ${MONITORS[$entry_b]})"
      cmd="xrandr --output ${MONITORS[$entry_a]} --auto --output ${MONITORS[$entry_b]} --auto --right-of ${MONITORS[$entry_a]}"
      for entry_c in $(seq 0 $((${NUM_MONITORS}-1))); do
          if [[ $entry_a != $entry_c && $entry_b != $entry_c ]]; then
              cmd="$cmd --output ${MONITORS[$entry_c]} --off"
          fi
      done
      COMMANDS[$index]=$cmd
      index+=1
    fi
  done
done

##
# Clone monitors
##
for entry_a in $(seq 0 $((${NUM_MONITORS}-1))); do
  for entry_b in $(seq 0 $((${NUM_MONITORS}-1))); do
    if [ $entry_a != $entry_b ]; then
      TITLES[$index]="Clone: $(get_mapping ${MONITORS[$entry_a]}) -> $(get_mapping ${MONITORS[$entry_b]})"
      cmd="xrandr --output ${MONITORS[$entry_a]} --auto --output ${MONITORS[$entry_b]} --auto --same-as ${MONITORS[$entry_a]}"
      for entry_c in $(seq 0 $((${NUM_MONITORS}-1))); do
          if [[ $entry_a != $entry_c && $entry_b != $entry_c ]]; then
              cmd="$cmd --output ${MONITORS[$entry_c]} --off"
          fi
      done
      COMMANDS[$index]=$cmd
      index+=1
    fi
  done
done

##
#  Generate entries, where first is key.
##
function gen_entries() {
  for a in $(seq 0 $(( ${#TITLES[@]} -1 ))); do
    echo $a ${TITLES[a]}
  done
}

# Call menu
SEL=$( gen_entries | rofi -dmenu -i -p "Monitor Setup" -a 0 -no-custom  | awk '{print $1}' )

# Call xrandr
$( ${COMMANDS[$SEL]} )
