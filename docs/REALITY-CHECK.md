# Alpha 1 Reality Check

## Before implementation

- Use standard live-build tooling instead of inventing a bootloader.
- Target UEFI/amd64 first.
- Use a real Chromium package.
- Do not claim an extension marketplace exists yet.
- Do not auto-execute browser downloads.
- Use QEMU + WHPX for Windows virtualization.
- Detect missing virtualization prerequisites instead of silently failing.
- Use mature Wayland primitives instead of writing a custom compositor in Alpha 1.

## After implementation

CI verifies that the image is produced, the checksum exists, required packages are configured, and the artifact can be uploaded.

Manual hardware verification remains mandatory because CI cannot prove compatibility with every GPU, Wi-Fi chipset, touchpad or firmware implementation.

## Known limitations

- Alpha 1 is a live image, not the finished installer.
- GPU acceleration varies by hardware and driver.
- Windows VM graphics are conservative in this first slice.
- The native NOVA app SDK is not shipped yet.
- The App Store and extension marketplace are architecture targets, not fake placeholders.
