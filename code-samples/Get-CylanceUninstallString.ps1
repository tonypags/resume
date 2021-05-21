function Get-CylanceUninstallString {
    <#
    .SYNOPSIS
    Helps to silently remove the application from the local system.
    .DESCRIPTION
    Searches the local registry for an uninstall string, 
    classifies the string based on path or GUID, 
    and returns a command with silent options.
    .EXAMPLE
    Invoke-Command (Get-CylanceUninstallString)
    .NOTES
    This function handles all known variations of uninstall strings for CylancePROTECT Antivirus. 
    Different versions use wildly different uninstall strings, and the logic in this function 
    was written such that new versions with different strings would be simple to add. 
    To add a case handler:
    1. Add a new pscustomobject item to the $Cases array, in the Begin block. 
       Also add a new switch case under the $foundCase switch in the Process block. 
       (copy existing items)
    2. Iterate the case integer in the array and the switch.
       (if you're creating the 5th item in the array, this should be 5)
    3. For the array, based on the string being handled, choose to use either Pattern or Like
       a. Pattern - If you plan to use a Regex pattern to identify this case.
       b. Like    - If you plan to use a wildcard match to identify this case.
       Set the item you didn't choose to $null. Only one or the other should be used here. 
    4. Configure the replacement value. This is optional, use it if you plan to replace 
       some or all text from the original string. 
    5. Update the new case under the switch to perform the string transformation. 
       Remember to also update the comment for this logic. 
    6. Make the the final variable name is unchanged, as this is the result that will be output. 
    Look at the existing cases for reference. If anything doesn't make sense, let me know/raise an issue. 
     -Tony
    #>
    [CmdletBinding()]
    param (
        # Path to log file for MSI case only
        [Parameter()]
        [string]
        $LogPath = 'c:\windows\temp\cylance-remove.log'
    )
    
    begin {

        # Load external function
        $Uri = 'https://raw.githubusercontent.com/tonypags/PsWinAdmin/master/Get-InstalledSoftware.ps1'
        (New-Object Net.WebClient).DownloadString($uri) | Invoke-Expression

        # Get local uninstall string for Cylance
        $strUninstall = Get-InstalledSoftware |
            Where-Object {$_.Name -like 'Cylance*'} |
            Select-Object -ExpandProperty UninstallCommand
        if (@($strUninstall).count -gt 1) {
            Write-Warning "Multiple strings found!"
            Write-Verbose "Proceeding with first item." -Verbose
            $strUninstall = $strUninstall[0]
        }
        Write-Verbose "Raw uninstall string: $($strUninstall)"
        
        # Define cases
        $Cases = @(
            [pscustomobject]@{
                Case = 1
                Pattern = $null
                Like = 'MsiExec.exe /X{*'
                Replacement = 'msiexec /X "{{{0}}}" /qn /norestart /log "{1}"' 
            }
            [pscustomobject]@{
                Case = 2
                Pattern = '\s\/modify'
                Like = $null
                Replacement = ' /uninstall'
            }
            [pscustomobject]@{
                Case = 3
                Pattern = $null
                Like = '*.exe"* /uninstall'
                Replacement = $null
            }
        )#END $Cases

    }#END: begin
    
    process {
        
    }
    
    end {
        
        # Test to see which case
        $foundCase = $null
        foreach ($Case in $Cases) {
            $thisCase = $Case.Case
            if ($strUninstall -match ($Case.Pattern) -and ($Case.Pattern)) {
                $foundCase = $thisCase
                continue
            } elseif ($strUninstall -like ($Case.Like) -and ($Case.Like)) {
                $foundCase = $thisCase
                continue
            }
        }#END foreach ($Case in $Cases)

        # Isolate my case
        $objCase = $Cases | Where-Object {$_.Case -eq $foundCase}

        Write-Verbose "Processing final Uninstall string..."
        switch ($foundCase) {
            1 {
                # Extract the GUId from the uninstall string
                $ptnGuid = '([A-Z0-9]{8}-([A-Z0-9]{4}-){3}[A-Z0-9]{12})'
                $guid = [regex]::Match($strUninstall,$ptnGuid).Groups[1].Value

                # Rebuild the uninstall string from guid and append log path to it
                [string]$strFinalString = (($objCase.Replacement) -f ($guid), ($LogPath))
            }
            2 {
                # Replace case pattern with replacement
                [string]$strFinalString = $strUninstall -replace ($objCase.Pattern), ($objCase.Replacement)
            }
            3 {
                # This case requires no modification
                [string]$strFinalString = $strUninstall
            }
            Default {throw 'unhandled case'}
        }#END switch ($foundCase)

        Write-Output " $($strFinalString) "
        
    }#END end
}#END function Get-CylanceUninstallString
