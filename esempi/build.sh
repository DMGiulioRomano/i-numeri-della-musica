#!/usr/bin/env bash
# Compila ogni esempio LilyPond (*.ly) in un PDF ritagliato (cropped),
# pronto per \includegraphics nel documento LaTeX.
# Uso:  bash esempi/build.sh
set -euo pipefail
cd "$(dirname "$0")"

shopt -s nullglob
for ly in *.ly; do
  echo ">> $ly"
  lilypond -dcrop=#t -dno-point-and-click --pdf -o "${ly%.ly}" "$ly" >/dev/null 2>&1
  # lilypond -dcrop produce <nome>.cropped.pdf
done
echo "Esempi compilati:"
ls -1 *.cropped.pdf 2>/dev/null || echo "(nessuno)"
