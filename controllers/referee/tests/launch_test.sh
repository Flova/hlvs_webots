#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage $0 <test_path>"
    exit -1
fi

if [ "$(expr substr $(uname -s) 1 10)" == "MSYS_NT-10" ]; then
  WEBOTS="webots"
else
  WEBOTS="${WEBOTS_HOME}/webots"
fi

TEST_FOLDER="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

WEBOTS_ROBOCUP_TEST_SCENARIO="${TEST_FOLDER}/test_scenario.json" \
                            WEBOTS_ROBOCUP_GAME="${TEST_FOLDER}/game.json" \
                            $WEBOTS --stdout --stderr --mode=fast
