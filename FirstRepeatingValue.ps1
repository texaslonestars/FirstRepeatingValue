<#
    Create a powershell function or cmdlet that takes an arbitrarily 
    long string parameter $foo (e.g. 'abcdedcba') 
    and returns the first recurring character in that Input string.
    In 'abcdedcba', 'd' would be the first recurring character, 
    so the cmdlet/function should return 'd' for that sample input.

    NOTE: Return nothing if no repeating letters or nothing sent
          Also assume a blank is a legal character
    
#>

<#
        Function:  GetRepeatingLetter $mystring
        Arguments: $foo = string of any length
        Return:    $return_value = first repeating character (blank if no repeating)
#>

Function GetRepeatingLetter {
    param (
        [string[]]$foo
    )

    #Intialize return_value
    $return_value=""

  #Early return if value is null to avoid error
  if ($foo -eq $null) {return $return_value}

    $char_ary = $foo.toCharArray()
    $hash = @{};
    
    #Loop through character array to find a repeat
    foreach ($letter in $char_ary) {
        #Exit loop if $letter repeated
        if ( $hash.containsKey($letter)  ) {
            $return_value = $letter
            break 
        } else {
            #Add to hash if letter not repeated
            $hash.add( $letter, 1 )
        }
    }
    
    return $return_value
}

<#
 Tests for function
 Test cases:
     powershell -File .\FirstRepeatingValue.ps1 samplestring      (should return 's'
     powershell -File .\FirstRepeatingValue.ps1 sampleample       (should return 'a'
     powershell -File .\FirstRepeatingValue.ps1 samplenothing     (should return ''
     powershell -File .\FirstRepeatingValue.ps1 "sample nothing " (should return ' '
     powershell -File .\FirstRepeatingValue.ps1 ""                (should return '')
     powershell -File .\FirstRepeatingValue.ps1                   (should return '')
#>


# Call function
$mystring = $args[0]
$return_value = GetRepeatingLetter $mystring
Write-Host "return value='$return_value'"
