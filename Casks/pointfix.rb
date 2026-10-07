cask "pointfix" do
  version "0.2.0"
  sha256 "e42a20e9d5ac39e4892611345c1b11f337baafaf864a11c5164fc3de41037247"

  url "https://download.pointfix.dev/Pointfix-#{version}.dmg"
  name "Pointfix"
  desc "Point at a UI problem and your local coding agent fixes it"
  homepage "https://pointfix.dev/"

  depends_on macos: :sequoia

  app "Pointfix.app"

  zap trash: [
    "~/Library/Preferences/dev.pointfix.mac.plist",
    "~/Library/Saved Application State/dev.pointfix.mac.savedState",
  ]
end
