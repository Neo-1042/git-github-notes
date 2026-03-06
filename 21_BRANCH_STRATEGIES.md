# Branch Strategy for 3 Environments

Git + BitBucket

1] DEV  
2] UAT  
3] PROD

<u>Approach</u>: 3-branch long-lived model plus feature
branches.

# Long-Lived Branches

We need only **three permanent branches**, each mapping to
an environment.

| Environment | Branch Name | Purpose  |
| :--- | :--- | :--- |
| **DEV**  | `develop` | Integration of features under active development. |
| **UAT**  | `release` | Code that is feature-complete and being validated by QA. |
| **PROD** | `main`    | Only production-ready, approved code.   |

# Short-Lived Branches

From `develop`, you create **feature branches**:

```
feature/<ticket-id>-<short-description>
```

Typical flow:

```
develop <- feature branches (merge into develop)
release <- release candidate (merged from develop)
main    <- production deployment (merged from release)
```

# Full Lifecycle Workflow

## 1. DEV phase

1. Developers create `feature/*` branches **from** develop.
2. When done, they open a **Pull Request** (PR) into develop.
3. After **code review**, the feature merges into `develop`.
4. Deployment pipeline deploys `develop` into the **DEV
environment**.

## 2. Preparing a Release to UAT

When DEV is ready for UAT:

1. Create a **release candidate**:  
`develop -> release`
2. Deployment pipeline deploys the `release` branch to UAT.
3. UAT and QA teams test it.

### Fixing bugs found in UAT

- Preferably, create **hotfix branches FROM release**:  
`release -> hotfix/uat-bug1 -> release`

- After merged into `release`, also merge them back into:
`develop`.

This keeps all branches consistent.  
Repeat until there no more bugs or errors in UAT.

## 3. Releasing to PROD

After UAT approval:

1. Merge the `release` branch into `main`:  
`release -> main`

2. Tag the release:  
`v1.0.0`

3. Deploy `main` to PROD.

# How to update the `main` branch?

- Only from `release`  
You **never commit directly to main** except through a PR:
`release -> main`  
This ensures that **what went through UAT is exactly what goes
to PROD**.

# How to keep `develop` in sync with production?

After pushing to `main` from `release`, merge the production
release back into `develop`:  
`main -> develop`

Sometimes, UAT contains hotfixes or last-minute changes,
which only exist in the `release` branch. You must not
loose that work.

# Hotfixes for PROD

When PROD has an urgent issue:  
1. Create a branch from `main`:  
`hotfix/<issue-id>`

2. Fix the issue and merge it into:  
```
main
develop
release (only if UAT cycle is still active)
```

# Summary Diagram

```
(feature branches)  
       |
    develop  <- hotfixes from release
       |
    release  <- release candidate stabilization
       |
      main   <- UAT-approved code only
```

# How to use this in BitBucket/GitHub?

- **Branch permissions**  
Protect `main`, `release` and `develop`: require pull requests,
minimum: 1-2 reviewers, no force pushes.

- **Default branch** (`develop` or `main`)  
If your workflow centers around **active development**:  
`develop` ---> DEFAULT BRANCH.  
Else, you can use:  
`main` ---> DEFAULT BRANCH.  

Remember: only `main` deploys to **PROD**. Tag on success.

# Git Commands

1. **Long-Lived branches:** `develop` (DEV), `release` (UAT),
`main` (PROD).
2. **Short-Lived branches:** `feature/*`,
`hotfix/uat-bug_20260305`, `hotfix/*`
3. **Merging Rules:** prefer PRs in BitBucket for merge/review.

CI/CD should deploy automatically on updates to 
`develop -> DEV`, `release -> UAT` and `main -> PROD`.

# 0] Clone and Branch Protection Hygiene

```bash
git clone <ssh-or-https>
cd <repo>

# Ensure you have main locally
git fetch origin
git checkout main
git pull --ff-only

# Create 'develop' from main if it doesn't exist yet
git checkout -b develop main
git push -u origin develop

# Create 'release' from develop if it doesn't exist yet
git checkout -b release develop
git push -u origin release

# Safer pulls and cleaner history
git config --global pull.ff only # Refuse implicit merges on pull
git config --global fetch.prune true # Prune deleted remote branches on fetch
```

> In BitBucket: Protect `main`, `release` and `develop`.
Require PRs, reviews, passing pipelines and disable
git push with force option.

# 1] feature -> develop

```bash
# ALWAYS start from the latest develop
git checkout develop # git switch develop
git pull --ff-only # Update with fast-forward only

# Create new feature branch
git checkout -b feature/TICKET-20260220-short-description

# Work, commit early and often
git add -A
git commit -m "Implement new feature. First step"

# Keep feature branch updated with the latest develop
# Rebasing keeps history clean
git fetch origin
git rebase origin/develop # Resolve conflicts if any, then
# git rebase --continue

# Push and set upstream
git push -u origin feature/TICKET-20260220-short-description

# In BITBUCKET, open a PR: feature -> develop (web UI)
# After PR is approved & merged, CI/CD should deploy to DEV.

# Clean up merged branch
git branch -d feature/TICKET-20260220-short-description
git push origin --delete feature/TICKET-20260220-short-description

```