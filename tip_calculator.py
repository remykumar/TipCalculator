#!/usr/bin/env python3
import sys
import time
from colors import bcolors
import colors

"""
A small program to calculate the tip amount at varying percentages
"""
# test commmit
class TipCalculator:
    newTotal = 0
def print_instruction():
    print(f'{bcolors.YELLOW}Usage : Enter the Total Bill amount and Tip % (options are 10,15,20,25,30) as program argument as whole numbers, like,')
    print(f'{bcolors.BLUE}python3 tip_calculator.py 200 20')

def tip10percent(total, tip):
    tipAmount = round(total * .10,2)
    TipCalculator.newTotal = total + tipAmount
    return tipAmount

def tip15percent(total, tip):
    tipAmount = round(total * .15,2)
    TipCalculator.newTotal = total + tipAmount
    return tipAmount

def tip20percent(total, tip):
    tipAmount = round(total * .20,2)
    TipCalculator.newTotal = total + tipAmount
    return tipAmount

def tip25percent(total, tip):
    tipAmount = round(total * .25,2)
    TipCalculator.newTotal = total + tipAmount
    return tipAmount

def tip30percent(total, tip):
    tipAmount = round(total * .30,2)
    TipCalculator.newTotal = total + tipAmount
    return tipAmount

if len(sys.argv) < 2:
    print_instruction()
else:
    total = int(sys.argv[1])
    tip = int(sys.argv[2])
    print(f'{bcolors.YELLOW}You entered, Total = {total}, Tip % = {tip}')
    if tip == 10:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip10percent(total,tip)}, New Total = {TipCalculator.newTotal}')
    elif tip == 15:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip15percent(total,tip)}, New Total = {TipCalculator.newTotal}')
    elif tip == 20:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip20percent(total,tip)}, New Total = {TipCalculator.newTotal}')
    elif tip == 25:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip25percent(total,tip)}, New Total = {TipCalculator.newTotal}')
    elif tip == 25:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip25percent(total,tip)}, New Total = {TipCalculator.newTotal}')
    elif tip == 30:
        print(f'{bcolors.BLUE}Recommended tipping amount = {tip30percent(total, tip)}, New Total = {TipCalculator.newTotal}')


