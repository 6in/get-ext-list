import unittest

suite "my suite":
    setup: 
        echo "hello"

    teardown:
        echo "teardown"

    test "first test":
        check 1 == 1
        