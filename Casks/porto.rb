cask "porto" do
  version "0.0.15-67db1ce"
  sha256 "ccd4cb65e469182d25fb7bc604cf87c4ed04766fdc2ba6de03f29a534fc3995a"

  url "https://github.com/croissantsam/porto/releases/download/v#{version}/Porto-macos.zip"
  name "Porto"
  desc "Menu bar app that lists your open TCP ports and lets you close them"
  homepage "https://github.com/croissantsam/porto"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+)?)$/i)
  end

  depends_on macos: :monterey

  app "Porto.app"

  # Porto is not code-signed yet, so macOS quarantines it on download.
  # Drop the quarantine attribute once Homebrew has verified the checksum.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Porto.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.porto.Porto.plist",
    "~/Library/Saved Application State/com.porto.Porto.savedState",
  ]
end