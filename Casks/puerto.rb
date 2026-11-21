cask "puerto" do
  version "0.0.19-05547cd"
  sha256 "88e945c40bf053a59da52b7bad855464f95126a148b413f01033ce823332b9ed"

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
