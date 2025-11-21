# Remote Lefthook Hooks

Remote `lefthook` hooks repository detailing this issue: https://github.com/evilmartians/lefthook/issues/121#issuecomment-3557282987.

See https://github.com/joevin-slq-docto/remote-hk-hooks/tree/using-run.

## Project Structure

```
.
├── lefthook.yml          # Remote Hook configuration.
├── mise.toml             # Install requirements on local reposistories.
└── .lefthook             # Utility scripts
    └── pre-commit
        ├── ggshield.sh
        ├── prettier.sh
        └── setup.sh
```

## How to use it ?

Create a `lefthook.yml` file:
```yaml
remotes:
  - git_url: https://github.com/joevin-slq-docto/remote-lefthook-hooks
    ref: using-script
```

## Limitation

Using `script` prevents the use of `{staged_files}`:
```yaml
script: prettier.sh
```
That slow down the hook as prettier need to run on all files (see `.lefthook/pre-commit/prettier.sh`).