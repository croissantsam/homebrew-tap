cask "porto" do
  version "0.0.14-7422e9d"
  sha256 "c32ea55164de38ddf918a45f86b0ef166e008a1e1440bada3bd77215a2c187a3"

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