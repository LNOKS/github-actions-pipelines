#!/bin/bash

BINARY_NAME="app"

PID=$(pgrep -f $BINARY_NAME)

if [ ! -z "$PID" ]; then
  echo "Stopping $BINARY_NAME with PID: $PID"
  kill $PID

  wait $PID 2>/dev/null
else
  echo "$BINARY_NAME is not running."
fi

echo "Starting $BINARY_NAME..."
nohup ./app &

echo "$BINARY_NAME restarted successfully."
