#!/bin/sh
# Start the NOVA Wayland session on the first live console.
# The guard prevents nested sessions when a terminal shell is opened later.
if [ "$(tty 2>/dev/null)" = "/dev/tty1" ] && [ -z "$WAYLAND_DISPLAY" ] && [ -z "$SSH_CONNECTION" ]; then
  exec sway
fi
