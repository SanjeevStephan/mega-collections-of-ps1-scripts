﻿<#
.SYNOPSIS
	Say an answer to 'good evening'
.DESCRIPTION
	This script answers "good evening" by text-to-speech (TTS).
.EXAMPLE
	PS> ./good-evening
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

$Answer = "And a special good evening to you too."

write-output "$Answer"
& "$PSScriptRoot/speak-english.ps1" "$Answer"
exit 0 # success
