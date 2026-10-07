cask "pointfix" do
  version "0.2.0"
  sha256 "19bc79135809938d372ce78fc5f12b6b87ef065403938b10838555fe7256b9ba"

  url "https://download.pointfix.dev/Pointfix-#{version}.dmg"
  name "Pointfix"
  desc "Point at a UI problem and your local coding agent fixes it"
  homepage "https://pointfix.dev"

  depends_on macos: ">= :sequoia"

  app "Pointfix.app"

  zap trash: [
    "~/Library/Preferences/dev.pointfix.mac.plist",
    "~/Library/Saved Application State/dev.pointfix.mac.savedState",
  ]
end
