#!/bin/bash

# Define the path to your vault
VAULT_DIR="$HOME/obsidian/"

# Navigate to the vault
cd "$VAULT_DIR" || exit

# Check if there are any changes (modified, added, or deleted files)
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Changes detected in Obsidian. Backing up..."
    
    # Stage all changes
    git add .
    
    # Commit with the current date and time
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "Backup: $TIMESTAMP"
    
    # Push to GitHub (assuming your remote is 'origin' and branch is 'master')
    git push origin master
    
    echo "✅ Backup pushed successfully!"
else
    echo "💤 No changes to backup."
fi
