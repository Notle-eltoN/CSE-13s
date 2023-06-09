#!/bin/bash

# Test normal operations with zero arguments
echo "Testing normal operations with zero arguments:"
./coolness > output.txt
if diff noInputs.txt output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi


# Test normal operations with one argument
echo "Testing normal operations with one argument:"
./coolness 32 > output.txt
if diff oneInput.txt output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi


# Test normal operations with two arguments
echo "Testing normal operations with two arguments:"
./coolness 32.5 10 > output.txt
if diff twoInputs.txt output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi


# Test temperature out of range
echo "Testing temperature out of range:"
./coolness 55 > output.txt
if grep -q "Error: Coolness. Acceptable input values are -99<=T<=50 and 0.5<=V." output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi


# Test wind out of range
echo "Testing wind out of range:"
./coolness 10 0 > output.txt
if grep -q "Error: Coolness. Acceptable input values are -99<=T<=50 and 0.5<=V." output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi

# Test both temperature and wind out of range
echo "Test both wind and temp out of range:"
./coolness 65 0 >output.txt
if grep -q "Error: Coolness. Acceptable input values are -99<=T<=50 and 0.5<=V." output.txt; then
    echo "Test passed"
else
    echo "Test failed"
fi

rm output.txt
