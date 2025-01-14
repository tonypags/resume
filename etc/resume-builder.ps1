# Order,Type,Source,Value,DevOps,PlatformEng,SysEng,
param(
    [Parameter(Position=0)]
    [ValidateSet(
        'DevOps',
        'PlatformEng',
        'SysEng'
    )]
    [string]
    $Mode
)

$links = '
[tony@pagliaro.co](mailto:tony@pagliaro.co) (Email)

[github.com/tonypags](https://github.com/tonypags) (Code Samples)

[linkedin.com/in/tony-pagliaro-a2923337](https://www.linkedin.com/in/tony-pagliaro-a2923337/) (LinkedIn Profile)

[credly.com/users/tony-pagliaro/badges](https://www.credly.com/users/tony-pagliaro/badges) (Azure Certification)
'

$configs = Import-Csv 'resume-line-items.csv'

$selected = $configs | ? $Mode -eq 'YES'

$techSkills = @()
$accomplishments = @()
$workHistory = @()

foreach ($item in $selected) {

    if ($item.Type -eq 'Skill') { $techSkills += $item }
    if ($item.Type -eq 'Accomplishment') { $accomplishments += $item }
    if ($item.Type -eq 'Work History') { $workHistory += $item }

}

$skillOrder = @(
    'Platforms'
    'Apps'
    'Languages'
    'OSes'
    'Microsoft'
    'Linux'
)
$skillsByType = $techSkills | Group Source
foreach ($type in $skillOrder) {
    $theseSkills = $skillsByType | ? Name -eq $type
    $hash.$type = ( $theseSkills.Group | Sort {e={$_.Order -as [int]}} ) -join ', '
}
# Then i need to store this somewhere.

foreach ($item in $accomplishments) {}

$workByCompany = $workHistory | Group Source
foreach ($item in $workByCompany) {}