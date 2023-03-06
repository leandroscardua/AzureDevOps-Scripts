#List all project in a Azure DevOps organization

# https://dev.azure.com/xxxxx
$organization = 

az devops project list --org $organization --query "value[].name" -o tsv
