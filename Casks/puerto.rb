cask "puerto" do
  version "0.0.24-737ede0"
  sha256 "7d75def57fe8cc22001bca0ad6548b793f71ecd8f2b80f7d2babd8cfbd0da87a"

  url "https://github.com/croissantsam/puerto/releases/download/v#{version}/Puerto-macos.zip"
  name "Puerto"
  desc "Menu bar app that lists your open TCP ports and lets you close them"
  homepage "https://github.com/croissantsam/puerto"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+)?)$/i)
  end

  # Puerto downloads and installs updates itself, so Homebrew shouldn't fight it.
  auto_updates true
  depends_on macos: :monterey

  app "Puerto.app"

  # Puerto is not code-signed yet, so macOS quarantines it on download.
  # Drop the quarantine attribute once Homebrew has verified the checksum.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Puerto.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.puerto.Puerto.plist",
    "~/Library/Saved Application State/com.puerto.Puerto.savedState",
  ]
end
