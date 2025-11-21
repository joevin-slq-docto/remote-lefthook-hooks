# Remote Lefthook Hooks

Remote `lefthook` hooks repository detailing this issue: https://github.com/evilmartians/lefthook/issues/121#issuecomment-3557282987.

See https://github.com/joevin-slq-docto/remote-lefthook-hooks/tree/using-script.

## Project Structure

```
.
├── lefthook.yml   # Remote Hook configuration.
├── mise.toml      # Install requirements on local reposistories.
└── ggshield.sh    # Utility scripts for a hook.
```

## How to use it ?

```bash
mkdir testLefthookRun && cd testLefthookRun && git init
```

Create a `lefthook.yml` file:
```yaml
remotes:
  - git_url: https://github.com/joevin-slq-docto/remote-lefthook-hooks
    ref: using-run
```

```bash
mise use lefthook@2.0.3
echo "import 'test';" > test.ts 
git add test.ts
lefthook install
lefthook run pre-commit
```

## Limitation

Using `run` require to guess the ref (`remote-lefthook-hooks-using-run` here):
```yaml
run: |
    export REMOTE_HOOKS_DIR=".git/info/lefthook-remotes/remote-lefthook-hooks-using-run"
    eval "$(mise -C $REMOTE_HOOKS_DIR env)"
    prettier --check {staged_files}
```