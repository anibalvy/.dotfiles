#/bin/bash


export TOUCHSCREEN=$(xinput list --id-only "Atmel Atmel maXTouch Digitizer")


xinput map-to-output $TOUCHSCREEN LVDS-1


