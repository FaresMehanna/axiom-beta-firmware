#!/bin/bash

# this script runs all tests in the ./test/ directory and generates a short report

cd $(dirname $(realpath $0))    # change into script dir

TESTS=./tests/*

FAILED=0
for test in $TESTS; do
    (exec "$test" && echo "passed $test :)") || (echo "failed $test :("; FAILED=$((FAILED+1)))
done
if [[ $FAILED == 0 ]];
    echo "all tests passed :)"
else
    echo "$FAILED tests failed :("
fi
