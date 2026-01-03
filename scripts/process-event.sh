#!/usr/bin/env bash
set -euo pipefail

mkdir -p output

EVENT_JSON="$EVENT_PATH"

TITLE=$(jq -r '.issue.title' "$EVENT_JSON")
AUTHOR=$(jq -r '.issue.user.login' "$EVENT_JSON")
ISSUE_NUMBER=$(jq -r '.issue.number' "$EVENT_JSON")
LABELS=$(jq -r '[.issue.labels[].name]' "$EVENT_JSON")

cat <<EOF > output/event.json
{
  "event": "$EVENT_NAME",
  "action": "opened",
  "issue_number": $ISSUE_NUMBER,
  "title": "$TITLE",
  "author": "$AUTHOR",
  "labels": $LABELS
  }
  EOF

  echo "Event processed successfully"