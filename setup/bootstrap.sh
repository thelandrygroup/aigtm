#!/bin/bash
# bootstrap.sh — ClearCo AI GTM Skills setup for Claude Code
#
# Usage:
#   From a blank Mac:
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thelandrygroup/aigtm/main/setup/bootstrap.sh)"
#
#   From a local clone:
#     ./setup/bootstrap.sh
#
#   Flags:
#     --check      Read-only health report (no changes)
#     --yes        Skip confirmation prompt
#     --no-launch  Do not auto-launch claude at the end
#     --help       Show this help

MISE_NODE_VERSION="24"
MISE_PYTHON_VERSION="3.13"
CLAUDE_DIR="$HOME/.claude"
WORKSPACE="$HOME/claude"
REPO_FULL_NAME="thelandrygroup/aigtm"
REPO_URL="https://github.com/thelandrygroup/aigtm.git"
TOTAL_PHASES=10
FAILED=0

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

ok() { echo -e "  ${GREEN}+${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
fail() { echo -e "  ${RED}x${NC} $1"; FAILED=$((FAILED + 1)); }
info() { echo -e "  ${BLUE}>${NC} $1"; }
phase() { echo -e "\n${BOLD}[$1/$TOTAL_PHASES]${NC} ${BOLD}$2${NC}"; }
has_cmd() { command -v "$1" >/dev/null 2>&1; }
add_to_path() { case ":$PATH:" in *":$1:"*) ;; *) export PATH="$1:$PATH" ;; esac; }

SCRIPT_SOURCE="${BASH_SOURCE[0]:-}"
if [ -n "$SCRIPT_SOURCE" ] && [ -f "$SCRIPT_SOURCE" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SOURCE")" && pwd)"
  REPO_DIR="$(dirname "$SCRIPT_DIR")"
  FROM_CURL=false
else
  REPO_DIR=""
  FROM_CURL=true
fi

[ -d "/opt/homebrew/bin" ] && add_to_path "/opt/homebrew/bin"
[ -d "$HOME/.local/share/mise/shims" ] && add_to_path "$HOME/.local/share/mise/shims"

MODE="install"
AUTO_YES=false
NO_LAUNCH=false

while [ $# -gt 0 ]; do
  case "$1" in
    --check) MODE="check"; shift ;;
    --yes|-y) AUTO_YES=true; shift ;;
    --no-launch) NO_LAUNCH=true; shift ;;
    --help|-h) head -24 "$0"; exit 0 ;;
    *) echo "Unknown option: $1 (try --help)"; exit 1 ;;
  esac
done

check_tool() {
  local name="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then ok "$name"; else warn "$name missing"; fi
}

run_check() {
  echo "ClearCo AI GTM Health Check - $(date '+%Y-%m-%d')"
  phase 1 "Xcode Command Line Tools + Git"
  check_tool "Xcode CLT" "xcode-select -p"
  check_tool "git" "command -v git"

  phase 2 "Homebrew"
  check_tool "Homebrew" "command -v brew"

  phase 3 "Developer tools"
  for cmd in mise jq gh fzf bat rg fd tree direnv http pandoc pdftotext magick ffmpeg tesseract yt-dlp; do
    check_tool "$cmd" "command -v $cmd"
  done

  phase 4 "Runtimes"
  check_tool "node" "command -v node"
  check_tool "python3" "command -v python3"

  phase 5 "Claude Code"
  check_tool "claude" "command -v claude"

  phase 6 "Public CLIs"
  for cmd in vercel stripe supabase wrangler netlify agent-browser; do
    check_tool "$cmd" "command -v $cmd"
  done

  phase 7 ".env"
  [ -f "$CLAUDE_DIR/.env" ] && ok ".env present" || warn "No ~/.claude/.env yet"

  phase 8 "Skills"
  if [ -d "$CLAUDE_DIR/skills" ]; then
    skill_count=$(find "$CLAUDE_DIR/skills" -maxdepth 1 -mindepth 1 \( -type d -o -type l \) 2>/dev/null | wc -l | tr -d ' ')
    [ "$skill_count" -gt 0 ] && ok "Skills installed ($skill_count linked)" || warn "No skills linked"
  else
    warn "No ~/.claude/skills directory yet"
  fi

  phase 9 "GitHub auth"
  gh auth status >/dev/null 2>&1 && ok "GitHub authenticated" || warn "GitHub auth not configured"

  phase 10 "Shell profile"
  [ -f "$HOME/.zshrc" ] && grep -q "AIGTM_BOOTSTRAP_START" "$HOME/.zshrc" && ok "Shell profile configured" || warn "Shell profile not configured"
  exit 0
}

[ "$MODE" = "check" ] && run_check

echo "==================================================="
echo "  ClearCo AI GTM Bootstrap"
echo "==================================================="
echo "This installs Claude Code dependencies and links ClearCo-tailored AI GTM skills."
echo

if ! $AUTO_YES; then
  printf "Ready to start? [Y/n] "
  read -r answer
  case "$answer" in [Nn]*) echo "Cancelled."; exit 0 ;; esac
fi

phase 1 "Xcode Command Line Tools + Git"
if xcode-select -p >/dev/null 2>&1; then
  ok "Xcode CLT available"
else
  info "Installing Xcode Command Line Tools. Accept the macOS prompt."
  xcode-select --install 2>/dev/null || true
  while ! xcode-select -p >/dev/null 2>&1; do sleep 5; done
  ok "Xcode CLT installed"
fi
has_cmd git && ok "git available" || { fail "git missing"; exit 1; }

phase 2 "Homebrew"
if has_cmd brew; then
  ok "Homebrew available"
else
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { fail "Homebrew install failed"; exit 1; }
fi
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)" && add_to_path "/opt/homebrew/bin"
[ -f /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)" && add_to_path "/usr/local/bin"

phase 3 "Developer tools"
brew_install() {
  local pkg="$1"
  local cmd="${2:-$1}"
  if has_cmd "$cmd"; then ok "$pkg available"; else
    info "Installing $pkg"
    brew install "$pkg" >/dev/null 2>&1 && ok "$pkg installed" || warn "$pkg install failed"
  fi
}
brew_install mise
brew_install jq
brew_install gh
brew_install fzf
brew_install bat
brew_install ripgrep rg
brew_install fd
brew_install tree
brew_install direnv
brew_install httpie http
brew_install pandoc
brew_install poppler pdftotext
brew_install imagemagick magick
brew_install ffmpeg
brew_install tesseract
brew_install yt-dlp

phase 4 "Node.js $MISE_NODE_VERSION + Python $MISE_PYTHON_VERSION"
if has_cmd mise; then
  mise install "node@$MISE_NODE_VERSION" >/dev/null 2>&1 || true
  mise use --global "node@$MISE_NODE_VERSION" >/dev/null 2>&1 || true
  mise install "python@$MISE_PYTHON_VERSION" >/dev/null 2>&1 || true
  mise use --global "python@$MISE_PYTHON_VERSION" >/dev/null 2>&1 || true
  add_to_path "$HOME/.local/share/mise/shims"
fi
has_cmd node && ok "node available" || warn "node missing"
has_cmd python3 && ok "python3 available" || warn "python3 missing"

phase 5 "Claude Code"
if has_cmd claude; then
  ok "Claude Code available"
elif has_cmd npm; then
  info "Installing Claude Code"
  npm install -g @anthropic-ai/claude-code >/dev/null 2>&1 && ok "Claude Code installed" || warn "Claude Code install failed"
else
  warn "npm missing; skipped Claude Code install"
fi

phase 6 "Public CLIs"
npm_install_global() {
  local pkg="$1"
  local cmd="${2:-$1}"
  if has_cmd "$cmd"; then ok "$cmd available"; elif has_cmd npm; then
    npm install -g "$pkg" >/dev/null 2>&1 && ok "$cmd installed" || warn "$cmd skipped optional"
  else
    warn "$cmd skipped optional"
  fi
}
npm_install_global vercel
npm_install_global stripe
npm_install_global supabase
npm_install_global wrangler
npm_install_global netlify-cli netlify
npm_install_global agent-browser

phase 7 "Bring Your Own Keys (.env setup)"
mkdir -p "$CLAUDE_DIR"
ENV_FILE="$CLAUDE_DIR/.env"
ENV_EXAMPLE="$REPO_DIR/setup/env.example"
if [ -f "$ENV_FILE" ]; then
  ok ".env already exists at $ENV_FILE"
elif [ -f "$ENV_EXAMPLE" ]; then
  cp "$ENV_EXAMPLE" "$ENV_FILE"
  chmod 600 "$ENV_FILE"
  ok "Copied env.example to $ENV_FILE"
else
  warn "env.example not available yet; skipping .env scaffold"
fi

phase 8 "ClearCo AI GTM Skills"
if $FROM_CURL; then
  REPO_DIR="$WORKSPACE/aigtm"
  mkdir -p "$WORKSPACE"
  if [ -d "$REPO_DIR/.git" ]; then
    ok "Repo already cloned at $REPO_DIR"
  elif has_cmd gh && gh repo clone "$REPO_FULL_NAME" "$REPO_DIR" -- --quiet 2>/dev/null; then
    ok "Cloned $REPO_FULL_NAME to $REPO_DIR"
  elif git clone "$REPO_URL" "$REPO_DIR" --quiet 2>/dev/null; then
    ok "Cloned $REPO_URL to $REPO_DIR"
  else
    fail "Could not clone $REPO_URL"
    echo "    Try: git clone $REPO_URL $REPO_DIR"
  fi
fi

mkdir -p "$CLAUDE_DIR/skills"
local_skills_dir="$REPO_DIR/skills"
if [ -d "$local_skills_dir" ]; then
  skill_count=0
  for skill_dir in "$local_skills_dir"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    target="$CLAUDE_DIR/skills/$skill_name"
    if [ -L "$target" ]; then
      ln -sfn "$skill_dir" "$target"
    elif [ -d "$target" ]; then
      continue
    else
      ln -sfn "$skill_dir" "$target"
    fi
    skill_count=$((skill_count + 1))
  done
  ok "Linked $skill_count skills to ~/.claude/skills/"
else
  fail "Skills directory not found at $local_skills_dir"
fi

phase 9 "GitHub authentication"
if has_cmd gh && gh auth status >/dev/null 2>&1; then
  ok "GitHub authenticated"
elif has_cmd gh; then
  warn "GitHub auth not configured; run gh auth login later if needed"
else
  warn "gh CLI not installed; skipping GitHub auth"
fi

phase 10 "Shell configuration"
zshrc="$HOME/.zshrc"
managed_block=$(cat << 'SHELL_BLOCK'
# === AIGTM_BOOTSTRAP_START ===
# Managed by aigtm/setup/bootstrap.sh — do not edit this block manually.
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/share/mise/shims:$HOME/.local/bin:$HOME/bin:$PATH"
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"
if [ -f "$HOME/.claude/.env" ]; then
  set -a
  . "$HOME/.claude/.env"
  set +a
fi
alias gs="git status"
alias gl="git log --oneline -20"
alias gd="git diff"
# === AIGTM_BOOTSTRAP_END ===
SHELL_BLOCK
)

if [ ! -f "$zshrc" ]; then
  echo "$managed_block" > "$zshrc"
  ok "Created ~/.zshrc"
elif grep -q "AIGTM_BOOTSTRAP_START" "$zshrc"; then
  tmp=$(mktemp)
  awk '/AIGTM_BOOTSTRAP_START/ { skip=1; next } /AIGTM_BOOTSTRAP_END/ { skip=0; next } !skip { print }' "$zshrc" > "$tmp"
  echo "" >> "$tmp"
  echo "$managed_block" >> "$tmp"
  mv "$tmp" "$zshrc"
  ok "Updated ~/.zshrc"
else
  echo "" >> "$zshrc"
  echo "$managed_block" >> "$zshrc"
  ok "Updated ~/.zshrc"
fi

echo
echo "==================================================="
if [ "$FAILED" -eq 0 ]; then
  echo "Setup complete. All $TOTAL_PHASES phases passed."
else
  echo "Setup finished with $FAILED issue(s). Run ./setup/bootstrap.sh --check for details."
fi
echo "==================================================="
echo

echo "Try: claude"
echo "Example: Prep me for my call with Acme Corp"

if $NO_LAUNCH; then
  exit 0
fi

if has_cmd claude && [ -n "$REPO_DIR" ] && [ -d "$REPO_DIR" ]; then
  cd "$REPO_DIR" || exit 0
  exec zsh -l -c "cd '$REPO_DIR' && claude"
fi
