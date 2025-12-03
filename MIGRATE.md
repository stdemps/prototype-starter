# Migrating Template to Separate Repository

This guide helps you move the workspace template to its own repository.

> **Note:** This template is designed to be used as a **separate repository**. If you're reading this from within a parent project, follow these steps to extract it.

## Quick Migration

Run the migration script:

```bash
cd workspace-template
./migrate-to-separate-repo.sh [repository-url]
```

The script will:
- Initialize git (if needed)
- Commit all files
- Set up remote repository
- Guide you through pushing to GitHub

Or follow the manual steps below.

## Manual Migration Steps

### 1. Create New Repository

Create a new GitHub repository (e.g., `workspace-template` or `cursor-workspace-template`).

### 2. Initialize New Repository

```bash
# Navigate to the template directory
cd workspace-template

# Initialize git (if not already)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Workspace template"

# Add remote (replace with your repo URL)
git remote add origin https://github.com/yourusername/workspace-template.git

# Push to new repository
git push -u origin main
```

### 3. Mark as GitHub Template

1. Go to your repository on GitHub
2. Click **Settings**
3. Scroll to **Template repository** section
4. Check **Template repository** checkbox
5. Click **Save**

### 4. Update Documentation

The documentation has been updated to reflect the separate repository structure. You may want to:

- Update `README.md` with your repository URL
- Update `SETUP.md` with the correct clone command
- Add a LICENSE file if needed

### 5. Clean Up (Optional)

If you want to remove the template from the original project:

```bash
# From the parent project root
rm -rf workspace-template
```

Or keep it as a reference and add a `.gitignore` entry if you don't want to track it.

## Verification

After migration, verify:

1. ✅ Repository is accessible
2. ✅ Can clone: `git clone <your-repo-url>`
3. ✅ Template checkbox is enabled on GitHub
4. ✅ `npm install` works
5. ✅ `npm run dev` starts successfully

## Using the Template

Once migrated, users can:

```bash
# Clone from GitHub
git clone https://github.com/yourusername/workspace-template.git my-project
cd my-project

# Or use GitHub's "Use this template" button
# Then clone the created repository
```

## Updating the Template

When you want to update the template:

```bash
cd workspace-template
# Make your changes
git add .
git commit -m "Update: [description]"
git push
```

Users can then update their projects by pulling changes or re-cloning.

