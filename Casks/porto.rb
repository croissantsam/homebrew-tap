cask "porto" do
  version "0.0.17-07cb25c"
  sha256 "f2f7faa60e4d7573a26620560e6e83bb1a5024548376fb7805e078681cb44a08"

  url "https://github.com/croissantsam/porto/releases/download/v#{version}/Porto-macos.zip"
  name "Porto"
  desc "Menu bar app that lists your open TCP ports and lets you close them"
  homepage "https://github.com/croissantsam/porto"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+)?)$/i)
  end

  # Porto downloads and installs updates itself, so Homebrew shouldn't fight it.
  auto_updates true
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