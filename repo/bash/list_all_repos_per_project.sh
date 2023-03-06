#!/bin/bash

#List all repos in a project

# https://dev.azure.com/xxxxxx"
organization=

for project in $(az devops project list --org $organization --query "value[].name" -o tsv){
echo
echo "Project: $project"

az repos list --org $organization --project $project --query '[].name' -o tsv

echo "Project: $project"
echo
}
