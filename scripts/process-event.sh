#!/usr/bin/env bash
set -euo pipefail

mkdir -p output

EVENT_JSON="$EVENT_PATH"

TITLE=$(jq -r '.issue.title' "$EVENT_JSON")
AUTHOR=$(jq -r '.issue.user.login' "$EVENT_JSON")
ISSUE_NUMBER=$(jq -r '.issue.number' "$EVENT_JSON")
LABELS=$(jq -c '[.issue.labels[].name]' "$EVENT_JSON")

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

COMMENT_BODY=$(jq -n \
  --arg title "$TITLE" \
  --arg author "$AUTHOR" \
  --argjson labels "$LABELS" \
  '{
    body: ("Thanks for opening this issue!\n\n" +
           "Title: " + $title + "\n" +
           "Author: " + $author + "\n" +
           "Labels: " + (if ($labels | length) == 0 then "none" else ($labels | join(", ")) end))
   }')

curl -sf -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/$ISSUE_NUMBER/comments \
  -d "$COMMENT_BODY"