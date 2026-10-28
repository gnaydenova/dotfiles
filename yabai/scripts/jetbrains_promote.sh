#!/bin/sh
# track/promote JetBrains main windows whose project title arrives after
# window creation; the TTL keeps manually floated windows (cmd+alt+d) alone.

STATE=/tmp/yabai-jetbrains-ids
TTL=120

now=$(date +%s)

case "$1" in
track)
    id=$YABAI_WINDOW_ID
    [ -n "$id" ] || exit 0
    if [ -f "$STATE" ]; then
        if awk -v now="$now" -v ttl="$TTL" '$1 + ttl > now' "$STATE" >"$STATE.tmp"; then
            mv "$STATE.tmp" "$STATE"
        else
            rm -f "$STATE.tmp"
        fi
    fi
    echo "$now $id" >>"$STATE"
    ;;
promote)
    id=$YABAI_WINDOW_ID
    [ -n "$id" ] || exit 0
    grep -q " $id$" "$STATE" 2>/dev/null || exit 0
    info=$(yabai -m query --windows --window "$id" 2>/dev/null)
    [ -n "$info" ] || exit 0
    # no-op if already managed
    printf '%s\n' "$info" | grep -Eq '"is-floating"[[:space:]]*:[[:space:]]*false' && exit 0
    yabai -m window "$id" --toggle float
    ;;
esac
