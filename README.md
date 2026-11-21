# homebrew-tap

Homebrew casks for [Croissant](https://github.com/croissantsam)'s apps.

## Usage

Homebrew 7 requires third-party taps to be trusted before their casks can be
installed:

```bash
brew tap croissantsam/tap
brew trust --cask croissantsam/tap/porto
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

## Notes

Porto is not code-signed or notarized yet, so `brew audit --cask --new` reports
a signature failure. The cask removes the `com.apple.quarantine` attribute after
Homebrew has verified the release checksum, so the app launches without a
Gatekeeper warning.