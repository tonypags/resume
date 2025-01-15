function disco {
  <#
  .EXAMPLE
  . .\disco.ps1
  disco
  .NOTES
  See this post for community generated alternatives:
  https://www.reddit.com/r/PowerShell/comments/pzcxc8/disco_terminal/
  #>

  $colors = [enum]::GetNames('System.ConsoleColor')

  $width = [Console]::WindowWidth
  $height = [Console]::WindowHeight

  $positions = 
    foreach($y in 0..($height-1)){
        foreach($x in 0..($width-1)){
            ,($x,$y)
        }
    }

  $indexes = 0..($positions.Length-1)
  $indexes = $indexes | Get-Random -Count $indexes.Length

  while ($true) {

    foreach($index in $indexes){
      $f = get-random $colors
      $b = get-random $colors
      [Console]::CursorLeft = $positions[$index][0]
      [Console]::CursorTop = $positions[$index][1]
      Write-Host "#" -nonewline -f $f -b $b
    }

  }#END: while ($true) {}

}#END: function disco {}
