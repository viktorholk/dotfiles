#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/sync-llm-skills.sh [--dry-run] [--copy] [--force] [--target DIR ...]

Install repo-managed Agent Skills.

Default install mode is symlink. Default target is:
  ${CODEX_HOME:-$HOME/.codex}/skills

Options:
  --dry-run      Show install actions without changing targets.
  --copy         Copy skill directories instead of symlinking them.
  --force        Replace same-named target directories that are not already linked.
  --target DIR   Install into a specific skills directory. Repeatable.
  -h, --help     Show this help.
USAGE
}

mode="link"
dry_run=0
force=0
targets=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      dry_run=1
      ;;
    --copy)
      mode="copy"
      ;;
    --force)
      force=1
      ;;
    --target)
      if [[ $# -lt 2 ]]; then
        echo "error: --target requires a directory" >&2
        exit 2
      fi
      targets+=("$2")
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "error: unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"
skills_root="$repo_root/skills"

if [[ ! -d "$skills_root" ]]; then
  echo "error: missing skills directory: $skills_root" >&2
  exit 1
fi

if [[ ${#targets[@]} -eq 0 ]]; then
  targets=(
    "${CODEX_HOME:-$HOME/.codex}/skills"
  )
fi

shopt -s nullglob
skill_dirs=()
for dir in "$skills_root"/*; do
  if [[ -d "$dir" && -f "$dir/SKILL.md" ]]; then
    skill_dirs+=("$dir")
  fi
done
shopt -u nullglob

if [[ ${#skill_dirs[@]} -eq 0 ]]; then
  echo "error: no skill directories with SKILL.md found under $skills_root" >&2
  exit 1
fi

install_skill() {
  local source_dir="$1"
  local target_root="$2"
  local name
  local target_dir

  name="$(basename "$source_dir")"
  target_dir="$target_root/$name"

  if [[ "$dry_run" -eq 1 ]]; then
    echo "would install $name -> $target_dir ($mode)"
    return 0
  fi

  mkdir -p "$target_root"

  if [[ -e "$target_dir" || -L "$target_dir" ]]; then
    if [[ -L "$target_dir" && "$(readlink "$target_dir")" == "$source_dir" ]]; then
      echo "already linked $target_dir"
      return 0
    fi
    if [[ "$force" -ne 1 ]]; then
      echo "error: refusing to replace existing $target_dir; rerun with --force to replace it" >&2
      return 1
    fi
    rm -rf "$target_dir"
  fi

  if [[ "$mode" == "copy" ]]; then
    cp -R "$source_dir" "$target_dir"
    echo "copied $name -> $target_dir"
  else
    ln -s "$source_dir" "$target_dir"
    echo "linked $name -> $target_dir"
  fi
}

for target in "${targets[@]}"; do
  for dir in "${skill_dirs[@]}"; do
    install_skill "$dir" "$target"
  done
done
