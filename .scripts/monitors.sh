#!/bin/bash
# Change monitor layout on the fly.

E_WRONGNUMBEROFARGS=86
E_UNKNOWNOPTION=87
E_NOEXTERNALSCREEN=88
NUMBER_OF_SCREENS=$(xrandr | grep " connected" | wc -l)

echo_help() { cat << EndOfMessage
Usage: $(basename $0) [option]
Option is one of the following:
--mirror
--external-only
--laptop-only
--extend
--initialize
--help
EndOfMessage
}

require_two_monitors() {
  [ $NUMBER_OF_SCREENS -ne 2 ] && {
    echo "No external screen detected"
    exit $E_NOEXTERNALSCREEN
  }
}

# Input validation
if [ $# -ne 1 ]  # Must provide one and only one nonempty argument
then
  echo_help
  exit $E_WRONGNUMBEROFARGS
fi

# These variables define desktop configuration
eDP1_opt=
HDMI1_opt=
bar=
keyboard_opt=

case $1 in
    --mirror)
    require_two_monitors
    eDP1_opt="--output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal"
    HDMI1_opt="--output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal"
    bar="HDMI1"
    keyboard_opt="-layout fi -variant nodeadkeys"
    ;;
    --external)
    require_two_monitors
    eDP1_opt="--output eDP1 --off"
    HDMI1_opt="--output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal"
    bar="HDMI1"
    keyboard_opt="-layout us -variant intl"
    ;;
    --laptop)
    eDP1_opt="--output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal"
    HDMI1_opt="--output HDMI1 --off"
    bar="eDP1"
    keyboard_opt="-layout fi -variant nodeadkeys"
    ;;
    --extend)
    require_two_monitors
    eDP1_opt="--output eDP1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal"
    HDMI1_opt="--output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal"
    bar="HDMI1"
    keyboard_opt="-layout us -variant intl"
    ;;
    --initialize)
    if [ $NUMBER_OF_SCREENS -eq 2 ]
    then
      eDP1_opt="--output eDP1 --off"
      HDMI1_opt="--output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal"
      bar="HDMI1"
      keyboard_opt="-layout us -variant intl"
    else
      eDP1_opt="--output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal"
      HDMI1_opt="--output HDMI1 --off"
      bar="eDP1"
      keyboard_opt="-layout fi -variant nodeadkeys"
    fi
    ;;
    --help)
    echo_help
    exit 0
    ;;
    *)    # unknown option
    echo_help
    exit $E_UNKNOWNOPTION
    ;;
esac

# Make sure conky gets to right screen and polybar is right size
killall --quiet conky polybar

xrandr \
  $eDP1_opt \
  --output DP1 --off \
  $HDMI1_opt \
  --output HDMI2 --off \
  --output VIRTUAL1 --off

polybar --quiet -r $bar &
conky --quiet
random_wallpaper.sh
setxkbmap $keyboard_opt

exit 0
