This is a fork of [posquit0/Awesome-CV](https://github.com/posquit0/Awesome-CV).

Cerify that remote points to it by running `git remote -v`. If not add the original repo as upstream:

```
git remote add upstream https://github.com/posquit0/Awesome-CV.git
```

**Pull upstream changes regularly**. Whenever you want to incorporate the latest template updates, fetch from upstream and merge (or rebase) onto your own branch:

```
git fetch upstream
git checkout main            # or whatever branch you work on
git merge upstream/master    # fast‑forward if there are no conflicts
# or: git rebase upstream/master
```