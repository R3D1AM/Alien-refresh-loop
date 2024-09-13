# Display initial status
Write-Output "Alive"

# Create WScript.Shell COM object for sending keys
$wsh = New-Object -ComObject WScript.Shell

# Define primary and alternative key combinations
$primaryKeyCombo = '+{F15}'           # Shift + F15
$alternativeKeyCombo = '^+6'          # Ctrl + Shift + 6 (representing ^^^)

# Infinite loop
while ($true) {
    try {
        # Attempt to send the primary key combination (Shift + F15)
        $wsh.SendKeys($primaryKeyCombo)
        
    } catch {
        # If sending F15 fails, fall back to Ctrl+Shift+6 (interpreted as ^^^)
        $wsh.SendKeys($alternativeKeyCombo)
        Write-Output "F15 not available. Sent Ctrl+Shift+6 (^^^) instead."
    }

    # Wait for 60 seconds
    Start-Sleep -Seconds 60
    
    # Output a status message
    Write-Output "Alien detected"
}
