#!/usr/bin/env bash
# List releases for a specific module using GitLab GraphQL API
# Usage: GITLAB_REPO="group/subgroup/project" ./list-releases-with-module.sh <module> [repo]

list_releases_with_module() {
  set +x  # disable any debug tracing
  local module="$1"                # e.g. s3-jam-content-bucket
  local repo="${2:-$GITLAB_REPO}"  # e.g. group/subgroup/project
  [[ -z "$module" || -z "$repo" ]] && { echo "usage: list_releases_with_module <module> [group/project]"; return 2; }

  # Regex: inside a backticked span, look for modules/<module> or services/<module>
  local re="\`[^\`]*\\b(modules|services)/[^\`]*\\b${module}\\b[^\`]*\`"
  local after=""

  while :; do
    local afterArg=""; [[ -n "$after" ]] && afterArg=", after: \"$after\""
    local query="
    {
      project(fullPath: \"$repo\") {
        releases(sort: RELEASED_AT_DESC, first: 100$afterArg) {
          pageInfo { hasNextPage endCursor }
          nodes { tagName description }
        }
      }
    }"
    local resp
    resp=$(glab api graphql -f query="$query" 2>/dev/null) || return $?

    # Print matching tags, strip leading 'v'
    jq -r --arg re "$re" '
      .data.project.releases.nodes[]
      | select(.description and (.description | test($re; "is")))
      | .tagName | sub("^v"; "")
    ' <<<"$resp"

    local hasNext
    hasNext=$(jq -r '.data.project.releases.pageInfo.hasNextPage' <<<"$resp")
    [[ "$hasNext" == "true" ]] || break
    after=$(jq -r '.data.project.releases.pageInfo.endCursor' <<<"$resp")
  done
}

# If sourced, don't run main. If executed, run the function.
# Works in both bash and zsh
if [[ -n "${BASH_SOURCE:-}" && "${BASH_SOURCE[0]}" != "${0}" ]] || \
   [[ -n "${ZSH_EVAL_CONTEXT:-}" && "${ZSH_EVAL_CONTEXT}" == "toplevel" ]]; then
  :  # sourced, don't run
else
  list_releases_with_module "$@"
fi
