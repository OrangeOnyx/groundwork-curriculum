#!/usr/bin/env bash
# bootstrap.sh — drop the right starter-pack files into the current directory.
#
# What it does:
#   1. Auto-detects your AI environment by looking at the current directory
#      (Cursor via .cursor/, Claude Code via .claude/) or asks if you're
#      using a web-based tool (Claude.ai, ChatGPT, Perplexity, Grok, Gemini)
#      or the Anthropic Console.
#   2. Copies the matching starter-pack files into your project (for CLI/IDE
#      tools) or prints them to stdout (for web tools that need paste).
#
# Usage:
#   # from the root of your project:
#   bash <(curl -sL https://raw.githubusercontent.com/OrangeOnyx/ai-fluency-program/master/shared/starter-packs/bootstrap.sh)
#
#   # or, if you cloned this repo:
#   bash /path/to/ai-fluency-program/shared/starter-packs/bootstrap.sh
#
#   # non-interactive (specify target directly):
#   bash bootstrap.sh --target cursor
#   bash bootstrap.sh --target claude-code
#   bash bootstrap.sh --target chatgpt --print
#
# Flags:
#   --target <name>   Skip auto-detect. One of:
#                     cursor, claude-code, claude-ai, anthropic-console,
#                     chatgpt, perplexity, grok, gemini
#   --print           Print pack contents to stdout instead of copying files.
#                     Default for web-based targets (claude-ai, chatgpt, etc.).
#   --list            List available targets and exit.
#   --help, -h        Show this help and exit.
#   --dry-run         Show what would happen, don't write anything.
#
# The script is idempotent: existing files are backed up with a .bak.<timestamp>
# suffix before being overwritten. Nothing is deleted.

set -euo pipefail

REPO_ROOT="${AI_FLUENCY_ROOT:-}"
STARTER_PACKS_ROOT=""
TARGET=""
PRINT_ONLY=0
DRY_RUN=0
LIST_ONLY=0

# ---------- locate the starter-packs directory ------------------------------
find_starter_packs() {
  # If the script is being piped from curl, $0 is 'bash' and we need to
  # download the pack contents. If the script is run from a checkout, we
  # can find sibling directories.
  local script_dir
  if [[ -f "${BASH_SOURCE[0]:-}" ]]; then
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -d "$script_dir/cursor" && -d "$script_dir/claude-code" ]]; then
      STARTER_PACKS_ROOT="$script_dir"
      return 0
    fi
  fi

  if [[ -n "$REPO_ROOT" && -d "$REPO_ROOT/shared/starter-packs" ]]; then
    STARTER_PACKS_ROOT="$REPO_ROOT/shared/starter-packs"
    return 0
  fi

  # Fallback: download from GitHub
  local tmp
  tmp="$(mktemp -d)"
  echo "-> Downloading starter packs to $tmp ..." >&2
  local base="https://raw.githubusercontent.com/OrangeOnyx/ai-fluency-program/master/shared/starter-packs"
  # We can't easily list remote files, so we clone the repo shallow.
  if command -v git >/dev/null 2>&1; then
    git clone --depth=1 --filter=blob:none --sparse \
      https://github.com/OrangeOnyx/ai-fluency-program.git "$tmp/repo" >&2
    (cd "$tmp/repo" && git sparse-checkout set shared/starter-packs >&2)
    STARTER_PACKS_ROOT="$tmp/repo/shared/starter-packs"
    return 0
  fi

  echo "ERROR: Could not locate starter-packs and 'git' is unavailable." >&2
  echo "       Clone the repo and re-run from the checkout, or set" >&2
  echo "       AI_FLUENCY_ROOT to the repo root." >&2
  return 1
}

# ---------- helpers ---------------------------------------------------------
list_targets() {
  cat <<EOF
Available targets:
  cursor              - IDE with .cursor/ folder support (writes .cursorrules,
                        .cursorignore, .cursor/rules/*.mdc)
  claude-code         - Anthropic's Claude Code CLI (writes .claude/ folder
                        with CLAUDE.md, agents/, commands/)
  claude-ai           - Claude.ai web (prints paste-ready system prompt)
  anthropic-console   - Anthropic Console for API tuning (prints)
  chatgpt             - ChatGPT web + custom instructions (prints)
  perplexity          - Perplexity Computer (prints)
  grok                - xAI Grok web (prints)
  gemini              - Google Gemini + Gems (prints)
EOF
}

usage() {
  sed -n '2,26p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

is_web_target() {
  case "$1" in
    claude-ai|anthropic-console|chatgpt|perplexity|grok|gemini) return 0 ;;
    *) return 1 ;;
  esac
}

# ---------- auto-detect -----------------------------------------------------
autodetect() {
  if [[ -d ".cursor" || -f ".cursorrules" ]]; then
    echo "cursor"
    return 0
  fi
  if [[ -d ".claude" || -f "CLAUDE.md" ]]; then
    echo "claude-code"
    return 0
  fi
  # No signal from current dir. Prompt.
  echo "" # signal: unknown
}

prompt_target() {
  echo "Could not auto-detect your AI environment." >&2
  echo "Choose one:" >&2
  echo "  1) cursor              (IDE)" >&2
  echo "  2) claude-code         (CLI)" >&2
  echo "  3) claude-ai           (web)" >&2
  echo "  4) anthropic-console   (API tuning)" >&2
  echo "  5) chatgpt             (web)" >&2
  echo "  6) perplexity          (web)" >&2
  echo "  7) grok                (web)" >&2
  echo "  8) gemini              (web)" >&2
  local choice
  read -r -p "Enter number [1-8]: " choice
  case "$choice" in
    1) echo "cursor" ;;
    2) echo "claude-code" ;;
    3) echo "claude-ai" ;;
    4) echo "anthropic-console" ;;
    5) echo "chatgpt" ;;
    6) echo "perplexity" ;;
    7) echo "grok" ;;
    8) echo "gemini" ;;
    *) echo "ERROR: invalid choice" >&2; exit 1 ;;
  esac
}

# ---------- copy or print ---------------------------------------------------
install_pack() {
  local target="$1"
  local src="$STARTER_PACKS_ROOT/$target"

  if [[ ! -d "$src" ]]; then
    echo "ERROR: pack directory not found: $src" >&2
    exit 1
  fi

  if [[ "$PRINT_ONLY" -eq 1 ]] || is_web_target "$target"; then
    echo "== Starter pack: $target =="
    echo "== Source: $src =="
    echo
    for f in "$src"/*.md "$src"/**/*.md; do
      [[ -f "$f" ]] || continue
      echo "----- $(basename "$f") -----"
      cat "$f"
      echo
    done
    return 0
  fi

  # File-copy path (cursor, claude-code)
  local ts
  ts="$(date +%Y%m%d-%H%M%S)"
  echo "-> Installing $target pack into $PWD"

  # Walk the source directory
  while IFS= read -r -d '' file; do
    local rel="${file#$src/}"

    # Skip the pack's own README (documentation, not a file to install)
    if [[ "$rel" == "README.md" ]]; then
      continue
    fi

    # Route Cursor .mdc rule files into .cursor/rules/
    if [[ "$target" == "cursor" && "$rel" == rules-*.mdc ]]; then
      rel=".cursor/rules/${rel#rules-}"
    fi

    # Route Claude Code agents/ and commands/ into .claude/
    if [[ "$target" == "claude-code" && "$rel" == agents/* ]]; then
      rel=".claude/$rel"
    fi
    if [[ "$target" == "claude-code" && "$rel" == commands/* ]]; then
      rel=".claude/$rel"
    fi

    local dest="$PWD/$rel"
    local destdir
    destdir="$(dirname "$dest")"

    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "  would write: $dest"
      continue
    fi

    mkdir -p "$destdir"
    if [[ -e "$dest" ]]; then
      echo "  backup: $dest -> $dest.bak.$ts"
      mv "$dest" "$dest.bak.$ts"
    fi
    cp "$file" "$dest"
    echo "  wrote: $dest"
  done < <(find "$src" -type f -print0)

  echo
  echo "Done. Review the files before you commit them."
  case "$target" in
    cursor)
      echo "Next: open your project in Cursor. It will pick up .cursorrules"
      echo "and .cursor/rules/*.mdc automatically." ;;
    claude-code)
      echo "Next: run 'claude' in this directory. CLAUDE.md, agents/, and"
      echo "commands/ are auto-loaded." ;;
  esac
}

# ---------- main ------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="$2"; shift 2 ;;
    --print) PRINT_ONLY=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    --list) LIST_ONLY=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "ERROR: unknown flag: $1" >&2; usage >&2; exit 1 ;;
  esac
done

if [[ "$LIST_ONLY" -eq 1 ]]; then
  list_targets
  exit 0
fi

find_starter_packs

if [[ -z "$TARGET" ]]; then
  TARGET="$(autodetect)"
  if [[ -z "$TARGET" ]]; then
    TARGET="$(prompt_target)"
  fi
fi

# Validate
case "$TARGET" in
  cursor|claude-code|claude-ai|anthropic-console|chatgpt|perplexity|grok|gemini) ;;
  *) echo "ERROR: unknown target: $TARGET" >&2; list_targets >&2; exit 1 ;;
esac

install_pack "$TARGET"
