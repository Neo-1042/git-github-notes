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
| **PROD** | `master`    | Only production-ready, approved code.   |

# Short-Lived Branches

From `develop`, you create **feature branches**:

```
feature/<ticket-id>-<short-description>
```

Typical flow:

```
develop <- feature branches (merge into develop)
release <- release candidate (merged from develop)
master    <- production deployment (merged from release)
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

1. Merge the `release` branch into `master`:  
`release -> master`

2. Tag the release:  
`v1.0.0`

3. Deploy `master` to PROD.

# How to update the `master` branch?

- Only from `release`  
You **never commit directly to master** except through a PR:
`release -> master`  
This ensures that **what went through UAT is exactly what goes
to PROD**.

# How to keep `develop` in sync with production?

After pushing to `master` from `release`, merge the production
release back into `develop`:  
`master -> develop`

Sometimes, UAT contains hotfixes or last-minute changes,
which only exist in the `release` branch. You must not
loose that work.

# Hotfixes for PROD

When PROD has an urgent issue:  
1. Create a branch from `master`:  
`hotfix/<issue-id>`

2. Fix the issue and merge it into:  
```
master
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
      master   <- UAT-approved code only
```

# How to use this in BitBucket/GitHub?

- **Branch permissions**  
Protect `master`, `release` and `develop`: require pull requests,
minimum: 1-2 reviewers, no force pushes.

- **Default branch** (`develop` or `master`)  
If your workflow centers around **active development**:  
`develop` ---> DEFAULT BRANCH.  
Else, you can use:  
`master` ---> DEFAULT BRANCH.  

Remember: only `master` deploys to **PROD**. Tag on success.

# Git Commands

1. **Long-Lived branches:** `develop` (DEV), `release` (UAT),
`master` (PROD).
2. **Short-Lived branches:** `feature/*`,
`hotfix/uat-bug_20260305`, `hotfix/*`
3. **Merging Rules:** prefer PRs in BitBucket for merge/review.

CI/CD should deploy automatically on updates to 
`develop -> DEV`, `release -> UAT` and `master -> PROD`.

# 0] Clone and Branch Protection Hygiene

```bash
git clone <ssh-or-https>
cd <repo>

# Ensure you have master locally
git fetch origin
git switch master
git pull --ff-only

# Create 'develop' from master if it doesn't exist yet
git checkout -b develop master
git push -u origin develop

# Create 'release' from develop if it doesn't exist yet
git checkout -b release develop
git push -u origin release

# Safer pulls and cleaner history
git config --global pull.ff only # Refuse implicit merges on pull
git config --global fetch.prune true # Prune deleted remote branches on fetch
```

> In BitBucket: Protect `master`, `release` and `develop`.
Require PRs, reviews, passing pipelines and disable
git push with force option.

# 1] `feature` -> `develop`

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

# 2] Prepare a Release Candidate (UAT)</br> `develop` -> `release`

Do this when the **DEV build is ready** for UAT.

```bash
# =================================================== # 
# If "release" does not exist yet, create it off "develop"
git fetch origin
git switch develop
git pull --ff-only

git checkout -b release develop
git push -u origin release

# Safer pulls & cleaner history (TO DO: study)
git config --global pull.ff only # Refuse implicit merges on pull
git config --global fetch.prune true # prune deleted remote branches on fetch.
# (Analyze this)
# =================================================== # 

# Update both branches locally
git switch develop
git pull --ff-only

git switch release
git pull --ff-only

# Promote develop to release (no fast-forward, to keep an
# explicit audit trail)
git merge --no-ff origin/develop -m "Promote develop to UAT (the release candidate)"
git push origin release

# CI/CD should deploy release -> UAT automatically
```

# 3] UAT bugfix flow (hotfix from `release`)

```bash
# Start from release
git switch release
git pull --ff-only

# Create UAT bugfix branch
git checkout -b hotfix/<uat-bug-ticket-id>

# Implement fix: add + commit.

# Push for PR
git push -u origin hotfix/<uat-bug-ticket-id>

# Open PR in BitBucket: hotfix/<uat-bug-ticket-id> -> release
# After PR merge, deployment to UAT via the release branch.

# Back-merge UAT fixes to develop, to keep parity
git switch develop
git pull --ff-only
git merge --no-ff origin/release -m "Back-merge UAT stabilization fixes"
git push origin develop
```

# 4] Go-Live (UAT approved) -> PROD (release->master) + TAG

```bash
# Ensure you're up to date
git switch release
git pull --ff-only

git switch master
git pull --ff-only

# Merge UAT-approved code into master
git merge --no-ff origin/release -m "Release v1.3.0 (UAT-approved)"

# Create a signed or annotated tag
# (Prefer signed if you have GPG setup)
git tag -a v1.3.0 -m "Release v1.4.0"

# Push master and the tag
git push origin master
git push origin v1.3.0

# CI/CD should deploy master->PROD automatically.
```

# 5] Keep `develop` in sync After PROD release (master->develop)

```bash
git switch develop
git pull --ff-only
git merge --no-ff origin/master -m "Sync with PROD release v1.3.0"
git push origin develop
```

# 6] PROD hotfix (urgent issue on PROD)

```bash
# Branch from master
git switch master
git pull --ff-only
git checkout -b hotfix/PROD-INC12345

# Implement fix: add + commit

# Push and create PR: hotfix/PROD-INC12345 -> master
git push -u origin hotfix/PROD-INC12345

# After PR approval, merge to master (or merge locally if needed)
git switch master
git pull --ff-only
git merge --no-ff hotfix/PROD-INC12345 -m "Merge hotfix for PROD INC12345"
git push origin master

# Tag a patch version
git tag -a v1.3.1 -m "Hotfix v1.3.1: PROD INC12345"
git push origin v1.3.1

# Back-merge hotfix to develop (and release, if a UAT cycle is still active)
git switch develop
git pull --ff-only
git merge --no-ff origin/master -m "Back-merge hotfix v1.3.1 from master"
git push or
```