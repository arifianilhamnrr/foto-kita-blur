#!/usr/bin/env bash
cd "$(dirname "$0")"
PORT="${PORT:-8767}"
echo "foto kita blur → http://127.0.0.1:${PORT}"
echo "dari HP (WiFi sama) → http://$(hostname -I 2>/dev/null | awk '{print $1}'):${PORT}"
exec python -m http.server "$PORT" --bind 0.0.0.0