#!/usr/bin/env bash
# Download MediaPipe Hands + camera_utils untuk versi browser.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MP="$ROOT/vendor/mediapipe/hands"
MP_VER="0.4.1646424915"
CU_VER="0.3.1640029074"

mkdir -p "$MP" "$ROOT/vendor/mediapipe/camera_utils"

JS_DELIVR="https://cdn.jsdelivr.net/npm/@mediapipe"
UNPKG="https://unpkg.com/@mediapipe"

download_file() {
  local dest="$1" url tmp
  shift
  tmp="${dest}.part"
  rm -f "$tmp"
  for url in "$@"; do
    echo "  → $url"
    if curl -fSL --retry 5 "$url" -o "$tmp"; then
      mv -f "$tmp" "$dest"
      echo "  ok $(basename "$dest")"
      return 0
    fi
    rm -f "$tmp"
  done
  echo "ERROR: gagal download $(basename "$dest")" >&2
  return 1
}

echo "== MediaPipe Hands =="
for f in hands.js hands.binarypb hands_solution_packed_assets.data \
  hands_solution_packed_assets_loader.js hands_solution_simd_wasm_bin.js \
  hands_solution_simd_wasm_bin.wasm hands_solution_wasm_bin.js \
  hands_solution_wasm_bin.wasm hand_landmark_full.tflite hand_landmark_lite.tflite; do
  echo "[$f]"
  download_file "$MP/$f" \
    "$JS_DELIVR/hands@$MP_VER/$f" \
    "$UNPKG/hands@$MP_VER/$f"
done

echo "== Camera Utils =="
download_file "$ROOT/vendor/mediapipe/camera_utils/camera_utils.js" \
  "$JS_DELIVR/camera_utils@$CU_VER/camera_utils.js" \
  "$UNPKG/camera_utils@$CU_VER/camera_utils.js"

echo "Done."