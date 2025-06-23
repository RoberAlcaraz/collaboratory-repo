# Collaboratory Repository

This is a repository to play and collaborate between teamates to learn the basics of Git & GitHub.

You have to try to do the following:


1. Repo setup (Person A)
    Create a new GitHub repository.
    Clone it locally and initialize the project structure (data/, scripts/, README.md).
    Push the initial structure to the main branch.

2. Add dummy data (Person B)
    Clone the repo and create a new branch for adding data.
    Populate the data/ folder with a small sample CSV.
    Push the branch and open a Pull Request into main.

3. Add processing script (Person C)
    Sync with the latest main, then create a branch for the script.
    Write a simple script in scripts/ that reads and plots the data.
    Push the branch and open a Pull Request into main.

4. Code review & merge (All)
    Review each other’s Pull Requests on GitHub, add comments if needed.
    Merge PRs in the correct order, and pull the updated main back to local clones.

5. Conflict simulation (Person B & C)
    Both edit the same line in README.md—one locally, one via GitHub web.
    Attempt to pull/merge to trigger a conflict, then resolve it together.

6. History exploration & revert (All)
    Inspect the full commit history with a graphical view.
    Identify a past commit, revert it in a new branch, open a PR for the revert, and merge.
