# Rename Script for CSS and TXT Files

A script (`rename_files.sh`) has been added to automate the renaming of `.css` and `.txt` files based on whether their filenames contain "apple" or "orange".

## How It Works
- Files containing "apple" in their names will have their extensions swapped to `.txt`.
- Files containing "orange" in their names will have their extensions swapped to `.css`.
- Files without "apple" or "orange" in their names are skipped.

## Usage
1. Make the script executable:
   ```bash
   chmod +x rename_files.sh
   ```
2. Run the script:
   ```bash
   ./rename_files.sh
   ```
3. Commit the changes:
   ```bash
   git add -A
   git commit -m "Rename .css/.txt files based on 'apple' or 'orange' content"
   git push
   ```

## Example
- `styles_apple.css` → `styles_apple.txt`
- `main_orange.txt` → `main_orange.css`

## Notes
- The script handles both `.css` and `.txt` files case-insensitively.
- It skips files that do not contain "apple" or "orange" in their names.
- A summary of renamed files is printed after execution.

## Future Steps
- If you want the files renamed immediately, run the script and commit the changes.
- If you prefer a different renaming logic, let me know!
