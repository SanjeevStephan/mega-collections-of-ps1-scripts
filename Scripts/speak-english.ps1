﻿<#
.SYNOPSIS
	speak-english.ps1 [<text>]
.DESCRIPTION
	Speaks the given text with an English text-to-speech (TTS) voice.
.EXAMPLE
	PS> .\speak-english.ps1 "Hello World"
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$text = "")

try {
	if ("$text" -eq "") { $text = read-host "Enter the English text to speak" }

	$Voice = New-Object -ComObject SAPI.SPVoice
	$Voices = $Voice.GetVoices()
	foreach ($OtherVoice in $Voices) {
		$Description = $OtherVoice.GetDescription()
		if ($Description -notlike "*- English*") { continue }
		$Voice.Voice = $OtherVoice
		[void]$Voice.Speak($text)
		exit 0
	}
	write-error "Sorry, no English text-to-speech voice found - please install one"
	exit 1
} catch {
	write-error "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
