#!/bin/bash

EQ_FILE="/eq.conf"
PA_FILE="/etc/pulse/default.pa"

if [[ ! -f $EQ_FILE ]]; then
    echo "Error: $EQ_FILE not found. Exiting."
    exit 1
fi

source "$EQ_FILE"

required_freqs=(FREQ_50 FREQ_100 FREQ_156 FREQ_220 FREQ_311 FREQ_440 FREQ_622 FREQ_880 FREQ_1250 FREQ_1750 FREQ_2500 FREQ_3500 FREQ_5000 FREQ_10000 FREQ_20000)
for freq in "${required_freqs[@]}"; do
    if [[ -z "${!freq}" ]]; then
        echo "Error: $freq not found in $EQ_FILE."
        exit 1
    fi
done

CONTROL_VALUES="${FREQ_50},${FREQ_100},${FREQ_156},${FREQ_220},${FREQ_311},${FREQ_440},${FREQ_622},${FREQ_880},${FREQ_1250},${FREQ_1750},${FREQ_2500},${FREQ_3500},${FREQ_5000},${FREQ_10000},${FREQ_20000}"

sed -i "s/control=[0-9,]*$/control=$CONTROL_VALUES/" "$PA_FILE"
