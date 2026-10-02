# NOVA OS Architecture

## System layers

```
UEFI
  |
Linux kernel + init
  |
system services
  |
Wayland / Sway
  |
NOVA shell configuration
  +-- launcher (Wofi)
  +-- panel (Waybar)
  +-- browser (Chromium)
  +-- files (Thunar)
  +-- terminal (foot)
  |
future NOVA Runtime
  +-- signed packages
  +-- permissions
  +-- web apps
  +-- extensions
```

NOVA uses Linux underneath rather than writing a kernel or browser engine. The product differentiation lives in the shell, application model, safety model and visual language.

Chromium is a real browser: direct Internet access, real downloads and a credible extension path. Downloads are files and are not automatically executed.

The Windows edition uses QEMU with WHPX acceleration where available. VM-specific integration lives in `windows/`.

The long-term data model separates immutable base system, user configuration, user data, downloaded artifacts and application state so atomic updates and rollback can be added without redesigning the user model.
