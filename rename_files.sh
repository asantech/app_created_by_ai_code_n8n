#!/usr/bin/env bash
set -euo pipefail

# Initialize counters
renamed_count=0
skipped_count=0

# Find all .css and .txt files (case-insensitive) under the repo root
export LC_ALL=C
while IFS= read -r -d '' file; do
  dir=$(dirname "$file")
  filename=$(basename "$file")
  name_noext="${filename%.*}"
  ext="${filename##*.}"

  # Skip if the extension is not .css or .txt (case-insensitive)
  if [[ "$ext" =~ ^(css|txt)$ ]]; then
    lowercase_name=$(echo "$name_noext" | tr '[:upper:]' '[:lower:]')
    
    # Determine new extension and new filename
    if [[ "$lowercase_name" == *"apple"* ]]; then
      new_ext="orange"
      new_filename="${name_noext}.${new_ext}"
    elif [[ "$lowercase_name" == *"orange"* ]]; then
      new_ext="apple"
      new_filename="${name_noext}.${new_ext}"
    else
      # Skip files that do not contain "apple" or "orange"
      ((skipped_count++))
      continue
    fi

    # Construct full new file path
    new_filepath="${dir}/${new_filename}"

    # Rename the file
    if mv "$file" "$new_filepath"; then
      echo "Renamed: $filename -> $new_filename"
      ((renamed_count++))
    else
      echo "Failed to rename: $filename" >&2
      exit 1
    fi
  fi
done < <(find . -maxdepth 10 -type f \( -iname "*.css" -o -iname "*.txt" \) -print0)

# Print summary
if (( renamed_count > 0 )); then
  echo "Summary: $renamed_count file(s) renamed, $skipped_count file(s) skipped."
else
  echo "No files needed renaming."
fi