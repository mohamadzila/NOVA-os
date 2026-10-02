# NOVA on Windows

Alpha 1 uses QEMU as the Windows host boundary.

Prerequisites:
- 64-bit Windows
- hardware virtualization enabled in firmware
- QEMU on PATH
- Windows virtualization support enabled where supported
- a NOVA qcow2 disk image

Run:

powershell -ExecutionPolicy Bypass -File .\NovaVM.ps1 -Disk .\nova.qcow2

Optional:

.\NovaVM.ps1 -Disk .\nova.qcow2 -MemoryGB 12 -Cores 6 -Fullscreen

Alpha 1 keeps host/guest file sharing conservative. The shared folder is prepared for the next integration milestone instead of being mounted automatically with broad host permissions.
