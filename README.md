\# Windows IT Support Diagnostic Tool



A lightweight PowerShell automation script built for Tier 1 IT support to quickly gather system specifications, check storage health, verify network connectivity, and export a clean diagnostic report.



\## Why I Built This

When troubleshooting slow computers or connectivity issues in a school or office environment, gathering basic system details manually takes several clicks. This script automates those checks into a single command and saves a timestamped report to the Desktop for easy ticket documentation.



\## Features

\- \*\*System \& OS Audit:\*\* Retrieves hostname, hardware model, OS version, and last reboot time (useful for spotting long uptimes).

\- \*\*Storage Check:\*\* Calculates free vs. total GB on the primary `C:` drive.

\- \*\*Network Check:\*\* Displays active local IPv4 addresses and tests external internet connectivity via ping (`8.8.8.8`).

\- \*\*Auto-Export:\*\* Saves a timestamped `.txt` report directly to the user's Desktop.



\## How to Run

1\. Download `Get-SystemHealth.ps1`.

2\. Open PowerShell in the script's directory and run:

&#x20;  ```powershell

&#x20;  powershell -ExecutionPolicy Bypass -File .\\Get-SystemHealth.ps1

