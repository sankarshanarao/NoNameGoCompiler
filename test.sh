#!/bin/bash
#Test Script
 
for i in examples/* ;
do
    echo $i =======================
    ./parser < $i;
    echo
done;