# Prints one function from an MSVC assembly listing (/FA), without noise.
# Usage: show_asm.ps1 <listing.asm> <function> [<first C line> <last C line>]
# Called from the demo*.cmd scripts. ASCII only on purpose: Windows PowerShell 5.1
# reads a BOM-less script in the ANSI code page.
param(
    [Parameter(Mandatory = $true)][string]$Listing,
    [Parameter(Mandatory = $true)][string]$Function,
    [int]$FromLine = 0,
    [int]$ToLine = 100000
)

if (-not (Test-Path -LiteralPath $Listing)) {
    Write-Host "  [!] listing not found: $Listing"
    exit 1
}

$inside = $false
$line = 0
$label = ''
foreach ($s in Get-Content -LiteralPath $Listing) {
    # a jump table (label + DD lines) is always shown, whatever the line filter
    if ($inside -and $s -match '^\$LN\d+@\S+:$') { $label = $s }
    if ($inside -and $s -match '^\s+DD\s' -and ($line -lt $FromLine -or $line -gt $ToLine)) {
        if ($label) { Write-Host "  $label  ; jump table" -ForegroundColor DarkGray; $label = '' }
        Write-Host ('  ' + ($s -replace "`t", '  '))
        continue
    }
    if (-not $inside) {
        if ($s -match "^$([regex]::Escape($Function))\s+PROC") { $inside = $true }
        continue
    }
    if ($s -match "^$([regex]::Escape($Function))\s+ENDP") { break }
    if ($s -match '^; Line (\d+)') {
        $line = [int]$matches[1]
        if ($line -ge $FromLine -and $line -le $ToLine) { Write-Host "  ; --- line $line" -ForegroundColor DarkGray }
        continue
    }
    if ($line -lt $FromLine -or $line -gt $ToLine) { continue }
    if ($s -match '^; File |^\s*npad\s|^\$LN\d+:$|^[a-zA-Z_$][\w$]* = \d+$|^;\s*COMDAT') { continue }
    Write-Host ('  ' + ($s -replace "`t", '  '))
}
