#!/bin/sh

# Display current weather and forecast of 'wttr.in' in the terminal

CITY="${1:-Ilmenau}"
TEMP_FILE="/tmp/wttr"
WEATHER_FILE="/home/martin/.wttr"

curl --max-time 10 --silent --show-error "wttr.in/$CITY" > $TEMP_FILE 2>/dev/null
#curl --max-time 10 -sS "wttr.in/Ilmenau?2" > $TEMP_FILE 2>/dev/null
#curl "wttr.in/Ilmenau" > $TEMP_FILE 2>/dev/null

if [ $(cat $TEMP_FILE | wc -l) -gt 7 ]; then
    mv $TEMP_FILE $WEATHER_FILE
fi

# supress printing the last line
head -n -2 $WEATHER_FILE

