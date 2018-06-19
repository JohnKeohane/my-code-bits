#!/bin/bash


echo "seaching for goose";

#seach file
findGoose=$(grep -i "Goose" "Activity.log.12345");
echo "$findGoose";
