#!/bin/sh
# Baobab installer - https://baobablang.dev
# Usage: curl -fsSL get.baobablang.dev | sh
#
# Source: https://github.com/baobablang/baobab/blob/main/install/install.sh
# This script installs the Baobab CLI (bao) via pipx.
# It requires Python 3.13+ and installs pipx if not already present.

set -e

PACKAGE="baobab-lang"
PYPI_URL="https://pypi.org/project/baobab-lang/"
DOCS_URL="https://baobablang.dev/docs"
STUDIO_URL="https://baobablang.dev"
MIN_MAJOR=3
MIN_MINOR=13

# ── Colors ────────────────────────────────────────────────────────────────────
if [ -t 1 ]; then
  BOLD="\033[1m"
  GREEN="\033[0;32m"
  RED="\033[0;31m"
  YELLOW="\033[0;33m"
  NC="\033[0m"
else
  BOLD=""
  GREEN=""
  RED=""
  YELLOW=""
  NC=""
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
info()    { printf "${BOLD}%s${NC}\n" "$1"; }
success() { printf "${GREEN}${BOLD}%s${NC}\n" "$1"; }
warn()    { printf "${YELLOW}%s${NC}\n" "$1"; }
error()   { printf "${RED}${BOLD}%s${NC}\n" "$1" >&2; }
die()     { error "$1"; exit 1; }

# ── Header ────────────────────────────────────────────────────────────────────
echo ""
info "🌳 Baobab Installer"
echo "────────────────────────────────────────"

# ── 1. Detect OS ──────────────────────────────────────────────────────────────
OS="$(uname -s)"
case "$OS" in
  Linux*)   PLATFORM="Linux" ;;
  Darwin*)  PLATFORM="macOS" ;;
  *)        die "❌ Unsupported OS: $OS. Please install manually: $DOCS_URL/installation" ;;
esac
info "Platform: $PLATFORM"

# ── 2. Check Python 3.13+ ─────────────────────────────────────────────────────
if ! command -v python3 >/dev/null 2>&1; then
  error "❌ Python ${MIN_MAJOR}.${MIN_MINOR}+ is required but not found."
  echo ""
  echo "   Install Python from: https://www.python.org/downloads/"
  echo "   Then re-run this installer."
  exit 1
fi

PY_MAJOR=$(python3 -c "import sys; print(sys.version_info.major)")
PY_MINOR=$(python3 -c "import sys; print(sys.version_info.minor)")
PY_VERSION="${PY_MAJOR}.${PY_MINOR}"

if [ "$PY_MAJOR" -lt "$MIN_MAJOR" ] || \
   { [ "$PY_MAJOR" -eq "$MIN_MAJOR" ] && [ "$PY_MINOR" -lt "$MIN_MINOR" ]; }; then
  error "❌ Python ${MIN_MAJOR}.${MIN_MINOR}+ required (found: $PY_VERSION)"
  echo ""
  echo "   Install Python from: https://www.python.org/downloads/"
  exit 1
fi

info "✓ Python $PY_VERSION"

# ── 3. Install pipx if missing ────────────────────────────────────────────────
if ! command -v pipx >/dev/null 2>&1; then
  warn "pipx not found - installing..."
  python3 -m pip install --quiet --user pipx || \
    die "❌ Failed to install pipx. Try: python3 -m pip install --user pipx"
  python3 -m pipx ensurepath >/dev/null 2>&1 || true
  # Make pipx available in this shell session
  export PATH="$HOME/.local/bin:$PATH"
fi

if ! command -v pipx >/dev/null 2>&1; then
  # Try common locations
  for candidate in "$HOME/.local/bin/pipx" "$HOME/Library/Python/${PY_VERSION}/bin/pipx"; do
    if [ -x "$candidate" ]; then
      export PATH="$(dirname "$candidate"):$PATH"
      break
    fi
  done
fi

command -v pipx >/dev/null 2>&1 || \
  die "❌ pipx installed but not found on PATH. Restart your terminal and re-run."

info "✓ pipx $(pipx --version)"

# ── 4. Install baobab-lang ────────────────────────────────────────────────────
info "📦 Installing $PACKAGE..."

if pipx list 2>/dev/null | grep -q "baobab-lang"; then
  warn "baobab-lang is already installed - upgrading..."
  pipx upgrade baobab-lang || pipx install baobab-lang --force
else
  pipx install baobab-lang
fi

# ── 5. Verify ─────────────────────────────────────────────────────────────────
if ! command -v bao >/dev/null 2>&1; then
  # Not on PATH yet - pipx ensurepath may need a shell restart
  warn ""
  warn "⚠️  'bao' is not on your PATH yet."
  warn "   Run: source ~/.zshrc  (or restart your terminal)"
  warn "   Then: bao --version"
  echo ""
  success "✅ Baobab installed!"
else
  BAO_VERSION=$(bao --version 2>/dev/null || echo "unknown")
  echo ""
  success "✅ Baobab installed! ($BAO_VERSION)"
fi

# ── 6. Next steps ─────────────────────────────────────────────────────────────
echo ""
echo "   Run a program  :  bao run programme.bao"
echo "   Documentation  :  $DOCS_URL"
echo "   Web Studio     :  $STUDIO_URL"
echo "   PyPI           :  $PYPI_URL"
echo ""
