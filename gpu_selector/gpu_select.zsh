#!/bin/zsh

# Script for changings primary gpu (nvidia-intel)

PATH_TO_NVIDIACONF='/path/to/nvidia.conf';

function print_usage () {
  echo "args: (nvidia|intel)";
  echo "";
  echo "Example: gpu_select nvidia";
}

if [ -z $1 ]; then
  print_usage
  exit;
fi

case $1 in
  "nvidia")
    ln -s $PATH_TO_NVIDIACONF /etc/X11/xorg.conf.d/nvidia.conf
    ;;
  "intel")
    rm /etc/X11/xorg.conf.d/nvidia.conf
    ;;
  *)
    print_usage
    ;;
esac