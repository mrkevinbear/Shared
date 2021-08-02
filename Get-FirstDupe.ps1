
Function Get-FirstDupe {

    <#
        .SYNOPSIS
        This function will find duplicate values in a given string(s).
        .DESCRIPTION
        This function will take a given value(s) and look for duplicate characters, then output the first character found or output if none were found.
        The function can be used with a single value, or multiple, or read from a text file.
        .PARAMETER Values (required)
        The Value to be evaluated.
        .EXAMPLE
        Get-FirstDupe -Values test
        .EXAMPLE
        Get-FirstDupe -Values value1, value2, value3
        .EXAMPLE
        Get-FirstDupe -Values (GC C:\Temp\Listofvalues.txt) 
    #>

[CmdletBinding()]

param (
[parameter(Mandatory=$True)]
[string[]]$Values
)


foreach ($Value in $Values)
    { 

    $ValueArray = $Value.ToCharArray()
    $Existing = New-Object -TypeName System.Collections.ArrayList

    $Dupe = $False

        foreach ($Element in $ValueArray) 
        {
        if ($Existing -contains $Element) 
        {
        $Dupe = $True
        break
        }
        $null = $Existing.Add($Element)        
        }
        
        if ($Dupe)
            {
            Write-Host "The first duplicate character in '$Value' is '$Element'" -ForegroundColor Green
            }
            else
            {
            Write-Host "There are no duplicate characters in '$Value'" -ForegroundColor Red
            }

    }
}


#For Testing - comment / uncomment as needed:
Get-FirstDupe -Values abcdedcba
#Get-FirstDupe -values (GC C:\temp\ListofValues.txt)
#Get-FirstDupe -values test2, 12345, 1234abcd1