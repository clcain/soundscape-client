#!/bin/bash

PA_FILE="/etc/pulse/default.pa"
EQ_FILE="/eq.conf"

if [[ ! -f $PA_FILE ]]; then
    echo "Error: $PA_FILE not found. Exiting."
    exit 1
fi

configure_equalizer() {
    if [[ ! -f $EQ_FILE ]]; then
        echo "$EQ_FILE not found."
        return 1
    fi

    source "$EQ_FILE"

    if [[ "$ENABLE_EQ" != "true" && "$ENABLE_EQ" != "True" && "$ENABLE_EQ" != "1" ]]; then
        echo "ENABLE_EQ is not true."
        return 1
    fi

    required_freqs=(
        FREQ_50
        FREQ_100
        FREQ_156
        FREQ_220
        FREQ_311
        FREQ_440
        FREQ_622
        FREQ_880
        FREQ_1250
        FREQ_1750
        FREQ_2500
        FREQ_3500
        FREQ_5000
        FREQ_10000
        FREQ_20000
    )

    for freq in "${required_freqs[@]}"; do
        if [[ -z "${!freq}" ]]; then
            echo "Error: $freq not found in $EQ_FILE. Exiting."
            exit 1
        fi

        if ! [[ "${!freq}" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "${!freq} < -10" | bc -l) )) || (( $(echo "${!freq} > 10" | bc -l) )); then
            echo "Error: $freq value ${!freq} is not a valid float or is out of the [-10, 10] range. Exiting."
            exit 1
        fi
    done

    CONTROL_VALUES="${FREQ_50},${FREQ_100},${FREQ_156},${FREQ_220},${FREQ_311},${FREQ_440},${FREQ_622},${FREQ_880},${FREQ_1250},${FREQ_1750},${FREQ_2500},${FREQ_3500},${FREQ_5000},${FREQ_10000},${FREQ_20000}"

    echo "load-module module-ladspa-sink sink_name=equalizer plugin=mbeq_1197 label=mbeq control=$CONTROL_VALUES" >> $PA_FILE
    echo "set-default-sink equalizer" >> $PA_FILE
}

start_pulseaudio() {
    echo "Starting pulseaudio..."
    pulseaudio --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
}

configure_equalizer || echo "EQ is not enabled."
start_pulseaudio
