# https://stackoverflow.com/questions/74134508/how-do-i-programmatically-delete-offline-agents-in-my-agent-pools-in-azuredevops
$org = ""
$poolid = ""
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Basic {base 64 encode PAT}XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
$agents = Invoke-RestMethod 'https://dev.azure.com/$org/_apis/distributedtask/pools/$poolid/agents' -Method 'GET' -Headers $headers

$agents.value |

    Where-Object { $_.status -eq 'offline' } |

    ForEach-Object {
        Invoke-RestMethod https://dev.azure.com/$org/_apis/distributedtask/pools/$poolid/agents/$($_.id)?api-version=6.0 -Method 'Delete' -Headers $headers
    }
