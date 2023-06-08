powershell -Command "$text = Get-Content -Path 'text.txt' -Encoding UTF8; (New-Object -ComObject SAPI.SpVoice).Speak($text)"
