﻿<#
.SYNOPSIS
	Lists installed command-line tools
.DESCRIPTION
	This PowerShell script lists all installed command-line tools (name/version/path/file size, sorted by name).
.EXAMPLE
	PS> ./list-cli-tools

	Name         Version         Path                                          FileSize
	----         -------         ----                                          --------
	at           10.0.19041.1    C:\WINDOWS\system32\at.exe                    31232
	...
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

function TryCmd { param([string]$Cmd, [string]$VersionArg)
	try {
		$Info = Get-Command $Cmd -ErrorAction Stop
		$Path = $Info.Source
		if ("$($Info.Version)" -eq "0.0.0.0") {
			if ("$VersionArg" -ne "") {
				$Result = Invoke-Expression "$Path $VersionArg"
				if ("$Result" -match '\d+.\d+\.\d+') {
					$Version = "$($Matches[0])"
				} elseif ("$Result" -match '\d+\.\d+') {
					$Version = "$($Matches[0])"
				} else {
					$Version = ""
				}
			} else {
				$Version = ""
			}
		} else {
			$Version = $Info.Version
		}
		if (Test-Path "$Path" -pathType leaf) {
			$FileSize = (Get-Item "$Path").Length
		} else {
			$FileSize = "0"
		}
		New-Object PSObject -Property @{ Name=$Cmd; Version=$Version; Path=$Path; FileSize=$FileSize }
	} catch {
		return
	}
}

function ListCmdTools { 
	TryCmd 7z	"-version"
	TryCmd ant	"-v"
	TryCmd apt	"--version"
	TryCmd apt-get	"--version"
	TryCmd amixer	"--version"
	TryCmd aplay	"--version"
	TryCmd ar	"--version"
	TryCmd arch	"--version"
	TryCmd arecord	"--version"
	TryCmd arp	""
	TryCmd at	""
	TryCmd attrib	""
	TryCmd awk	"--version"
	TryCmd b2sum	"--version"
	TryCmd base32	"--version"
	TryCmd base64	"--version"
	TryCmd basename "--version"
	TryCmd basenc	"--version"
	TryCmd bash	"--version"
	TryCmd bc	"--version"
	TryCmd bunzip2	"--version"
	TryCmd bzcat	"--version"
	TryCmd bzip2	"--version"
	TryCmd bzip2recover "--version"
	TryCmd captoinfo "-V"
	TryCmd cat	"-version"
	TryCmd cc	"--version"
	TryCmd chattr	"--version"
	TryCmd chcon	"--version"
	TryCmd chdsk	""
	TryCmd chgrp	"--version"
	TryCmd chmod	"--version"
	TryCmd chkntfs ""
	TryCmd chown	"--version"
	TryCmd chroot	"--version"
	TryCmd choco	"--version"
	TryCmd cipher	""
	TryCmd cksum	"--version"
	TryCmd clang	"--version"
	TryCmd clear	"-V"
	TryCmd cmake	"--version"
	TryCmd cmd	""
	TryCmd cmp	"--version"
	TryCmd column	"--version"
	TryCmd comp	""
	TryCmd compact	""
	TryCmd cp	"--version"
	TryCmd cpack	"--version"
	TryCmd csplit	"--version"
	TryCmd ctest	"--version"
	TryCmd curl	"--version"
	TryCmd cut	"--version"
	TryCmd cygcheck	"--version"
	TryCmd cygpath	"--version"
	TryCmd d2u	"--version"
	TryCmd dash	"--version"
	TryCmd date	""
	TryCmd dd	"--version"
	TryCmd df	"--version"
	TryCmd diff	"--version"
	TryCmd diff3	"--version"
	TryCmd dir	"--version"
	TryCmd dircolors "--version"
	TryCmd dirname	"--version"
	TryCmd dism	""
	TryCmd dos2unix	"--version"
	TryCmd driverquery ""
	TryCmd du	"--version"
	TryCmd echo	"--version"
	TryCmd egrep	"--version"
	TryCmd env	"--version"
	TryCmd ex	"--version"
	TryCmd expand	"--version"
	TryCmd expr	"--version"
	TryCmd factor	"--version"
	TryCmd false	"--version"
	TryCmd fido2-assert "--version"
	TryCmd fido2-cred   "--version"
	TryCmd fido2-token  "--version"
	TryCmd file	"--version"
	TryCmd find	"--version"
	TryCmd fgrep	"--version"
	TryCmd fmt	"--version"
	TryCmd fold	"--version"
	TryCmd ftp	"-?"
	TryCmd funzip	"--version"
	TryCmd gawk	"--version"
	TryCmd gencat	"--version"
	TryCmd getconf	"--version"
	TryCmd getopt	"--version"
	TryCmd gettext  "--version"
	TryCmd gcc	"--version"
	TryCmd gdb	"--version"
	TryCmd gh	"--version"
	TryCmd git	"--version"
	TryCmd gkill	"--version"
	TryCmd gmondump "--version"
	TryCmd gpg	"--version"
	TryCmd gpg-agent "--version"
	TryCmd gpgconf	"--version"
	TryCmd gpg-error "--version"
	TryCmd gpgsplit	"--version"
	TryCmd gpgtar	"--version"
	TryCmd grep	"--version"
	TryCmd groups	"--version"
	TryCmd gzip	"--version"
	TryCmd head	"--version"
	TryCmd hcsdiag	""
	TryCmd help	"--version"
	TryCmd hmac256	"--version"
	TryCmd hostid	"--version"
	TryCmd hostname ""
	TryCmd htop	"--version"
	TryCmd icacls   "--version"
	TryCmd iconv	"--version"
	TryCmd id	"--version"
	TryCmd ipfs	"--version"
	TryCmd java	"--version"
	TryCmd join	"--version"
	TryCmd kill	"--version"
	TryCmd ldd	"--version"
	TryCmd less	"--version"
	TryCmd link	"--version"
	TryCmd ln	"--version"
	TryCmd locale	"--version"
	TryCmd locate	"--version"
	TryCmd logname	"--version"
	TryCmd ls	"--version"
	TryCmd lsattr	"-V"
	TryCmd lsb_release ""
	TryCmd lzma	"--version"
	TryCmd mac2unix "--version"
	TryCmd make	"--version"
	TryCmd md5sum	"--version"
	TryCmd minidumper "--version"
	TryCmd mkdir	"--version"
	TryCmd mkfifo	"--version"
	TryCmd mkgroup	"--version"
	TryCmd mknod	"--version"
	TryCmd mkpasswd "--version"
	TryCmd mktemp	"--version"
	TryCmd mount	"--version"
	TryCmd MpCmdRun "-h"
	TryCmd netsh	""
	TryCmd netstat	""
	TryCmd nice	"--version"
	TryCmd nohup	"--version"
	TryCmd nroff	"--version"
	TryCmd nslookup ""
	TryCmd openssl	""
	TryCmd passwd	"--status"
	TryCmd paste	"--version"
	TryCmd perl	"--version"
	TryCmd ping	"-V"
	TryCmd ping6	"-V"
	TryCmd pip	"--version"
	TryCmd pip3	"--version"
	TryCmd pip3.8	"--version"
	TryCmd powercfg "/?"
	TryCmd powershell "--version"
	TryCmd print	""
	TryCmd printf	"--version"
	TryCmd python	"--version"
	TryCmd python3	"--version"
	TryCmd python3.8 "--version"
	TryCmd rasdial	"--version"
	TryCmd regedit	"--version"
	TryCmd replace	"--version"
	TryCmd robocopy "--version"
	TryCmd route	""
	TryCmd rsh	""
	TryCmd rsync	"--version"
	TryCmd rundll32 "--version"
	TryCmd scp	""
	TryCmd sftp	""
	TryCmd sh	"--version"
	TryCmd sha1sum	"--version"
	TryCmd sha256sum "--version"
	TryCmd sha512sum "--version"
	TryCmd ssh	"-V"
	TryCmd ssh-keygen ""
	TryCmd smartctl	"--version"
	TryCmd sort		"--version"
	TryCmd split	"--version"
	TryCmd strace	"--version"
	TryCmd strings	"--version"
	TryCmd strip	"--version"
	TryCmd sudo		"--version"
	TryCmd systeminfo ""
	TryCmd tail		"--version"
	TryCmd tar		"--version"
	TryCmd taskkill ""
	TryCmd tasklist ""
	TryCmd tee	"--version"
	TryCmd time	""
	TryCmd timeout	""
	TryCmd top	"-v"
	TryCmd tskill	""
	TryCmd typeperf ""
	TryCmd tzsync	"--version"
	TryCmd uniq	"--version"
	TryCmd vi	"--version"
	TryCmd vim	"--version"
	TryCmd vulkaninfo "--version"
	TryCmd w32tm	"/?"
	TryCmd waitfor	"--version"
	TryCmd wakeonlan ""
	TryCmd wget	"--version"
	TryCmd where	"--version"
	TryCmd whatis	"--version"
	TryCmd which	""
	TryCmd winget	"--version"
	TryCmd winsat	""
	TryCmd whoami	"--version"
	TryCmd wput	"--version"
	TryCmd write	""
	TryCmd wsl	"--version"
	TryCmd xcopy	"--version"
	TryCmd yes	"--version"
	TryCmd zip	"--version"
	TryCmd zipcloak "--version"
	TryCmd zipdetails ""
	TryCmd zipgrep	""
	TryCmd zipinfo	""
	TryCmd zipnote	""
	TryCmd zipsplit ""
	TryCmd zsh	"--version"
}
 
try {
	ListCmdTools | Format-Table -property @{e='Name';width=12},@{e='Version';width=15},@{e='Path';width=70},@{e='FileSize';width=10}
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
