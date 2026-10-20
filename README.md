# Fxpoet Tap

## How do I install these casks?

`brew install --cask fxpoet/tap/prompt-combo`

Or `brew tap fxpoet/tap` and then `brew install --cask prompt-combo`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "fxpoet/tap"
cask "prompt-combo"
```

> macOS arm64 (Apple Silicon) 전용입니다. 설치 후 업데이트는 앱이 자동으로 처리합니다.

## PromptCombo final release and ComboRun

- `prompt-combo` is retained at its final release, **0.9.13**, using
  `fxpoet/prompt-combo-releases`. Do not bump this cask to ComboRun versions.
- ComboRun will use a separate `combo-run` cask and `fxpoet/combo-run-releases`,
  starting at **1.0.0**. Its macOS DMG has not been published yet, so the new
  cask is not available in this tap.
- Do not add a `cask_renames.json` mapping from `prompt-combo` to `combo-run`.
  Installing ComboRun will be an explicit choice for existing users.
- Both apps use `~/.combo` for application data. Keep this directory out of
  cask uninstall and zap targets.

To upgrade an existing Homebrew installation to the final PromptCombo release:

```sh
brew update
brew upgrade --cask --greedy fxpoet/tap/prompt-combo
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
