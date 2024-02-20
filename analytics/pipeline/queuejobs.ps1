$pat= ""
$bytes = [System.Text.Encoding]::UTF8.GetBytes(":$($pat)")
$base64bytes = [System.Convert]::ToBase64String($bytes)
$headers = @{ "Authorization" = "Basic $base64bytes"}

$organization = ""
# Select the desired ID, for the AzurePipeline use 9
$poolid = ""

$uri = "https://dev.azure.com/$organization/_apis/distributedtask/pools/$poolid/jobrequests?agentId=140&completeRequestCount=25"

$result = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get -ContentType "application/json"
