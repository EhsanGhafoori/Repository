#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input
# Formula: Simple Interest = (Principal × Rate × Time) / 100

echo "=== Simple Interest Calculator ==="
echo ""

# Get principal amount
read -p "Enter the principal amount: " principal

# Validate principal (must be a positive number)
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]] || [ -z "$principal" ]; then
    echo "Error: Principal amount must be a positive number."
    exit 1
fi

# Get rate of interest
read -p "Enter the rate of interest (as percentage): " rate

# Validate rate (must be a positive number)
if ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]] || [ -z "$rate" ]; then
    echo "Error: Rate of interest must be a positive number."
    exit 1
fi

# Get time period
read -p "Enter the time period (in years): " time

# Validate time (must be a positive number)
if ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]] || [ -z "$time" ]; then
    echo "Error: Time period must be a positive number."
    exit 1
fi

# Calculate simple interest using bc for floating point arithmetic
# Formula: SI = (P * R * T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "=== Calculation Results ==="
echo "Principal Amount: \$$principal"
echo "Rate of Interest: $rate%"
echo "Time Period: $time years"
echo "--------------------------------"
echo "Simple Interest: \$$simple_interest"
echo "Total Amount: \$$total_amount"
echo ""
