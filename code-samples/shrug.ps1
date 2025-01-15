function shrug {
    <#
    .EXAMPLE
    . .\shrug.ps1
    shrug

    ¯\_(ツ)_/¯
    #>
    (175,92,95,40,12484,41,95,47,175 | ForEach-Object {[char]$_}) -join ''
}