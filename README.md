# Remote Lefthook Hooks

This branch `using-args` proves the following issue has been resolved: https://github.com/evilmartians/lefthook/issues/121#issuecomment-3557282987.

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

```bash
mkdir testLefthookScript && cd testLefthookScript && git init
```

Create a `lefthook.yml` file:
```yaml
remotes:
  - git_url: https://github.com/joevin-slq-docto/remote-lefthook-hooks
    ref: using-args
```

```bash
mise use lefthook@2.0.6
echo "import 'test';" > test.ts > test1.ts > "test 2.ts"
git add test.ts "test 2.ts"
lefthook install
lefthook run pre-commit --verbose
```

## Conclusion

Since `v2.0.5` with https://github.com/evilmartians/lefthook/pull/1206, we now can use `args` to pass `{staged_files}`:
```yaml
args: "{staged_files}"
script: prettier.sh
```

Using `prettier --check "$@"` in `ggshield.sh`, prettier is now running only on staged files !
```bash
[warn] test 2.ts
[warn] test.ts
[warn] Code style issues found in 3 files. Run Prettier with --write to fix.
```

Well done @mrexox !