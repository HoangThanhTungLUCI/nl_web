# Gitflow
****
Any features to the repository should be started as branches coming off the `Development` branch and 
be prefixed with `feature/`

Any bugs to the repository should be started as branches coming off the `Development` branch and
be prefixed with `bugfix/`

Any patches for production should be applied directly to `Master` AND `Development` and be prefixed with 
`hotfix/`

All branches should be associated with a `pull request` for merging back into `Development` or `Master` branches.

## Workflow for new feature branch
* Start on Development branch (git checkout development)
* Pull recent changes (`git pull`)
* Create new branch (`git checkout -b feature/[feature-name]`)
* Add changes (`git status` to see changes, `git add .` to add all changes)
* Commit changes (`git commit -m 'commit message'`)
* Push to Github (`git push origin feature/[feature-name]`)

Once the local `feature branch` is pushed up to `Github`, initiate a `pull request` to have it included into the 
main `Development branch`.

## Workflow for hotfix applied directly to Master
* Start on Master branch (`git checkout master`)
Force pull `Master` (`git pull -f`)
* Create new hotfix branch (`git checkout -b hotfix/[hotfix-name]`)
* Add changes (`git status` to see changes, `git add .` to add all changes)
* Commit changes (`git commit -m 'commit message'`)
* Push to Github (`git push origin hotfix/[hotfix-name]`)


**Once the local `hotfix` branch is pushed up to Github, initiate a `pull request` to have it included into 
the main `Master` branch. As a general rule, you should not accept your own `pull request`. Once approved, `merge hotfix/[hotfix-name]` into `Development` as well as `Master`.**

## Pull Request Template
### Description
* Please include a summary of the changes and the related issue. Please also include relevant motivation 
and context. List any dependencies that are required for this change.

### Related Issue
* This project only accepts pull requests related to open issues
* Please link to the issue **here**:

### Type of change
Please delete options that are not relevant.

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] This change requires a documentation update

### Screenshots
* Insert screenshots (if necessary)