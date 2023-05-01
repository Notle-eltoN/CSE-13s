#!/bin/bash

# Test 1: Basic input
input="3 -4 5 1 7 0
8 0 15 12 3 5
3 3 3 3 3"
expected_output="16 bins of size 1 for range [0,16)
[  0:  0] **
[  1:  1] *
[  2:  2] 
[  3:  3] *******
[  4:  4] 
[  5:  5] **
[  6:  6] 
[  7:  7] *
[  8:  8] *
[  9:  9] 
[ 10: 10] 
[ 11: 11] 
[ 12: 12] *
[ 13: 13] 
[ 14: 14] 
[ 15: 15] *"
echo "$input" | ./histogram > actual_output.txt
diff actual_output.txt <(echo "$expected_output")
# rm actual_output.txt


# Test 2: Input with number outside original range
input="3 -4 5 1 7 0
8 0 15 12 3 5
18"
expected_output="16 bins of size 1 for range [0,16)
16 bins of size 2 for range [0,32)
[  0:  1] ***
[  2:  3] **
[  4:  5] **
[  6:  7] *
[  8:  9] *
[ 10: 11] 
[ 12: 13] *
[ 14: 15] *
[ 16: 17] *
[ 18: 19] *
[ 20: 21] 
[ 22: 23] 
[ 24: 25] *
[ 26: 27] 
[ 28: 29] 
[ 30: 31] "
echo "$input" | ./histogram > actual_output.txt
diff actual_output.txt <(echo "$expected_output")
# rm actual_output.txt


# Test 3: Input with number well past the current bin size
input="150"
expected_output="16 bins of size 1 for range [0,16)
16 bins of size 2 for range [0,32)
16 bins of size 4 for range [0,64)
16 bins of size 8 for range [0,128)
16 bins of size 16 for range [0,256)
[  0: 15] 
[ 16: 31] 
[ 32: 47] 
[ 48: 63] 
[ 64: 79] 
[ 80: 95] 
[ 96:111] 
[112:127] 
[128:143] 
[144:159] *
[160:175] 
[176:191] 
[192:207] 
[208:223] 
[224:239] 
[240:255] "
echo "$input" | ./histogram > actual_output.txt
diff actual_output.txt <(echo "$expected_output")

# Clean up temporary file
rm actual_output.txt


