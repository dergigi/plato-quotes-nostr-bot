#!/bin/bash

MYDIR=$(dirname $(readlink -f $0))

NUMQ=$(cat $MYDIR/quotes.json | jq '. | length')
RANDQ=$((1 + $RANDOM % $NUMQ))

QUOTE=$(cat $MYDIR/quotes.json | jq -r --arg i $RANDQ '.[$i|tonumber].quote')

NOTE="\"$QUOTE\""
echo $NOTE

GOBINPATH=($HOME/go/bin)
$GOBINPATH/noscl publish "$NOTE"
