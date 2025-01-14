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

$coMap = @{
    NFL = 'National Football League (NFL) for JDA TSG'
    RFA = 'Richard Fleischman and Associates, Inc.'
    DCI = 'Domino Computing, Inc.'
    CKP = 'Costas Kondylis & Partners LLP'
}

$configs = Import-Csv 'resume-line-items.csv'

$selected = $configs | ? $Mode -eq 'YES'

$techSkills = @()
$accomplishments = @()
$workHistory = @()

$strTechSkills = ''
$strAccomplishments = ''
$strWorkHistory = ''

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
    $thisStr = ( $theseSkills.Group | Sort {e={$_.Order -as [int]}} | % {$_.Value} ) -join ', '
    $strTechSkills += "**$($Type)**: $($thisStr)`n`n"
}

foreach ($item in $accomplishments) {
    $thisAccomp = $accomplishments | % {$_.Value}
    $strAccomplishments += "* $($thisAccomp)`n"
}

$workByCompany = $workHistory | Group @{e={$_.Source -replace '~.*$'}} # by company
foreach ($comp in $workByCompany) {
    $companyByRoles = $comp.Group | Group Source # by role @ company
    $thisCompName = $coMap."$($comp.Name)"
    foreach ($role in $companyByRoles) {
        $thisRole = $role.Name -replace '^.+?~' -replace '~.*$' # role title
        $thisDate = $role.Name -replace '^.+~' # role dates
        $strWorkHistory += "**$($thisRole)** $($thisDate)`n"
        foreach ($item in $role.Group) {
            $indent = $item.Value.Length - $item.Value.Trim().Length
            $strWorkHistory += "$(' ' * $indent)* $($item.Value.Trim())`n"
        }
    }
}

$finalMarkdown = @()
$finalMarkdown += 'Tony Pagliaro'
$finalMarkdown += '(718) 864-6367'
$finalMarkdown += $links
$finalMarkdown += "`n<br>`n"
$finalMarkdown += '
**Professional Overview:** Self-motivated and highly skilled Automated Solutions Engineer
with a strong background in IT Operations and a history of modernizing legacy solutions and maintaining proprietary workflows in high-risk environments.
An outcome-driven, detail-oriented, critical thinker who excels at learning new business and technical functions quickly.
Adept at building streamlined technology tools and customized, forward-looking, middle-ware solutions for complex environments.
Improves productivity, integrates platforms, develops and deploys production software, and enables bespoke monitoring with granular requirements.
Effective at reducing risk of changes with thorough methods of procedure (MOPs), and providing superior communication to stakeholders with attention to detail.
'
$finalMarkdown += '## Technical Skills'
$finalMarkdown += $strTechSkills
$finalMarkdown += "`n<br>`n"
$finalMarkdown += '## Accomplishments'
$finalMarkdown += $strAccomplishments
$finalMarkdown += "`n<br>`n"
$finalMarkdown += '## Work History'
$finalMarkdown += $strWorkHistory
$finalMarkdown += "`n<br>`n"
$finalMarkdown += '## Education'
$finalMarkdown += '
### University of Hartford - West Hartford, CT
B.S. in Mechanical Engineering with a Concentration in Acoustics 2000 – 2003
<br>Minor: Mathematics
<br>Status: Graduated with Honors, May 2003
<br>GPA: 3.5 / 4.0

<br>

### University of New Haven - West Haven, CT
B.S. in Industrial Engineering 1998 – 2000
<br>Status: Transferred
'

# Out to file with unique
$Now = Get-Date
$finalMarkdown -join "`n" | Out-File "..\results\$($Mode)_$($Now.ToString('yyyy-MM-dd HH:mm:ss.fff')).md"
