param(
  [Parameter(Mandatory=$true)]
  [string]$Disk,
  [ValidateRange(2,64)]
  [int]$MemoryGB = 8,
  [ValidateRange(1,32)]
  [int]$Cores = 4,
  [switch]$Fullscreen
)

$ErrorActionPreference = "Stop"

function Fail([string]$Message) {
  Write-Host ""
  Write-Host "NOVA VM preflight failed" -ForegroundColor Red
  Write-Host $Message
  exit 1
}

$qemu = Get-Command qemu-system-x86_64.exe -ErrorAction SilentlyContinue
if (-not $qemu) {
  Fail "QEMU was not found on PATH. Install a current QEMU build first."
}

if (-not (Test-Path -LiteralPath $Disk)) {
  Fail "Disk image not found: $Disk"
}

$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
if (-not $cpu.VirtualizationFirmwareEnabled) {
  Write-Host "Warning: firmware virtualization is not reported as enabled." -ForegroundColor Yellow
  Write-Host "NOVA can still attempt to start, but performance may be poor."
}

$vmp = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -ErrorAction SilentlyContinue
if ($vmp -and $vmp.State -ne "Enabled") {
  Write-Host "Warning: Virtual Machine Platform is not enabled." -ForegroundColor Yellow
  Write-Host "Enable it in Windows Features for WHPX acceleration."
}

$args = @(
  "-machine", "q35,accel=whpx",
  "-cpu", "max",
  "-smp", "$Cores",
  "-m", ( "$" + "{MemoryGB}G" ),
  "-drive", "file=$Disk,if=virtio,format=qcow2",
  "-device", "virtio-vga",
  "-nic", "user,model=virtio",
  "-display", "gtk,zoom-to-fit=on",
  "-audiodev", "driver=wasapi,id=nova-audio",
  "-device", "ich9-intel-hda",
  "-device", "hda-duplex,audiodev=nova-audio"
)

if ($Fullscreen) {
  $args += "-full-screen"
}

Write-Host ""
Write-Host "NOVA OS Alpha 1" -ForegroundColor Cyan
Write-Host "Starting VM: $MemoryGB GB RAM / $Cores CPU cores"
Write-Host "Network: user-mode NAT"
Write-Host "Graphics: virtio"
Write-Host "Acceleration: WHPX"
Write-Host ""

& $qemu.Source @args
