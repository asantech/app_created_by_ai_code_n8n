# Files Renaming Script

A Bash script (`rename_files.sh`) has been added to the repository root to rename `.css` and `.txt` files based on their filenames:

- If a filename contains `apple`, its extension is changed to `.orange`.
- If a filename contains `orange`, its extension is changed to `.apple`.
- Files that do not contain `apple` or `orange` are skipped.

## Usage

1. Make the script executable:
   ```bash
   chmod +x rename_files.sh
   ```

2. Run the script:
   ```bash
   ./rename_files.sh
   ```

3. The script will output a summary of renamed and skipped files.

## Notes

- The script operates recursively under the repository root.
- Only files with `.css` or `.txt` extensions are considered.
