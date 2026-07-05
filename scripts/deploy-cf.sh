#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="$ROOT/dist"
PROJECT="${CF_PAGES_PROJECT:-foto-kita-blur}"

cd "$ROOT"

if ! npx wrangler whoami &>/dev/null; then
  echo "Belum login Cloudflare. Jalankan dulu:"
  echo "  cd $ROOT && npx wrangler login"
  exit 1
fi

echo "== Build static dist =="
rm -rf "$DIST"
mkdir -p "$DIST"
cp index.html "$DIST/"
cp -r audio vendor "$DIST/"

echo "== Deploy ke Cloudflare Pages ($PROJECT) =="
npx wrangler pages deploy "$DIST" \
  --project-name="$PROJECT" \
  --branch=main \
  --commit-dirty=true

echo ""
echo "Selesai."
echo "  Live: https://foto-kita-blur.arnr.dev"
echo "  CF:   https://foto-kita-blur-3tj.pages.dev"