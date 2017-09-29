#!/bin/sh

set -x

echo "Hello"
lava-test-case hello-test --result pass
