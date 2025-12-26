#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input

echo "======================================"
echo "    Simple Interest Calculator"
echo "======================================"
echo ""

# Get user input for principal amount
read -p "Enter the principal amount ($): " principal

# Validate principal input
while ! [[ "$principal" =~ ^[0-9]*\.?[0-9]+$ ]] || (( $(echo "$principal <= 0" | bc -l) )); do
    echo "Please enter a valid positive number for principal amount."
    read -p "Enter the principal amount ($): " principal
done

# Get user input for rate of interest
read -p "Enter the rate of interest (%): " rate

# Validate rate input
while ! [[ "$rate" =~ ^[0-9]*\.?[0-9]+$ ]] || (( $(echo "$rate < 0" | bc -l) )) || (( $(echo "$rate > 100" | bc -l) )); do
    echo "Please enter a valid rate between 0 and 100."
    read -p "Enter the rate of interest (%): " rate
done

# Get user input for time period
read -p "Enter the time period (years): " time

# Validate time input
while ! [[ "$time" =~ ^[0-9]*\.?[0-9]+$ ]] || (( $(echo "$time <= 0" | bc -l) )); do
    echo "Please enter a valid positive number for time period."
    read -p "Enter the time period (years): " time
done

echo ""
echo "======================================"
echo "         Calculation Results"
echo "======================================"

# Calculate simple interest
# Formula: Simple Interest = (Principal × Rate × Time) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $interest" | bc -l)

# Display results
echo "Principal Amount    : $ $principal"
echo "Rate of Interest    : $rate %"
echo "Time Period         : $time years"
echo "Simple Interest     : $ $interest"
echo "Total Amount        : $ $total_amount"
echo ""
echo "Formula Used: Simple Interest = (Principal × Rate × Time) ÷ 100"
echo "======================================"
