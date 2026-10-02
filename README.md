# NOVA OS

> A portable computer environment: boot it from a drive, or run the same system inside Windows.

NOVA OS Alpha 1 is the first engineering foundation for the NOVA vision. It favors real, testable system primitives over mock UI: a bootable Linux image, a Wayland desktop configuration, a real Chromium browser, a native Windows VM launcher, persistent configuration, and a documented path toward the NOVA app/extension platform.

## Alpha 1 goals

- Bootable UEFI Linux image built in GitHub Actions.
- Persistent NOVA desktop configuration.
- Wayland desktop using Sway, Waybar and Wofi.
- Chromium as the real Internet browser.
- Files, terminal, browser and system tools available from the launcher.
- Consistent NOVA visual language.
- Windows host launcher using QEMU + WHPX.
- Security-first package/install design documented before an app store is introduced.

## Reality-check policy

Every feature follows: **before** verify assumptions and failure modes; **build** the smallest real version; **after** test boot, restart, persistence, accessibility, failure recovery and resource use; **polish** until the UI accurately describes reality.

## Build

Run **Actions → Build NOVA OS Alpha 1** and download the `nova-alpha1-live-iso` artifact. Verify `SHA256SUMS` before writing the image to a drive.

## Windows VM

See `windows/NovaVM.ps1`. Alpha 1 expects QEMU and uses WHPX acceleration when available.

## Status

**Alpha 1 — engineering foundation**

This is not a production OS yet. Hardware compatibility, GPU acceleration, suspend/resume, installer reliability and the complete application/extension ecosystem still require dedicated test cycles.
