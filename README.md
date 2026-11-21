# homebrew-tap

Homebrew casks for [Croissant](https://github.com/croissantsam)'s apps.

## Usage

```bash
brew tap croissantsam/tap
brew install --cask porto
```

## Available casks

| Cask | Description |
|------|-------------|
| [porto](Casks/porto.rb) | Menu bar app that lists your open TCP ports and lets you close them |

## Updating casks

Casks are bumped automatically by the `Update Homebrew tap` workflow in the
upstream project whenever a release is published. To update one by hand:

```bash
brew bump-cask-pr porto
```