[CmdletBinding()]
param (
    $OrganizationUrl,
    $PAT
)

$orgUrl = $OrganizationUrl
$pat = $PAT

$projectsUrl = "$OrganizationUrl/_apis/projects?api-version=5.1"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$projects = Invoke-RestMethod -Uri $projectsUrl -Method Get -ContentType "application/json" -Headers $header
$projects.value | ForEach-Object {
   Write-Host $_.id $_.name
   $user =[pscustomobject]@{
        'id' = $_.id
        'name' = $_.name
    }
}
