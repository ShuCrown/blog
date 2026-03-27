#!/bin/sh
set -eu

if [ -f .env ]; then
  set -a
  . ./.env
  set +a
fi

: "${CLOUDFLARE_PAGES_PROJECT_NAME:?set CLOUDFLARE_PAGES_PROJECT_NAME in .env or your shell}"

pnpm build
pnpm exec wrangler pages deploy dist --project-name="$CLOUDFLARE_PAGES_PROJECT_NAME"
