cask "lidguard" do
  version "1.0"
  sha256 "f854ee94c54b9dc52a90d16ad6a60fa0241799f7e484f031ec02a5b8998a2a0b"

  url "https://github.com/geetpurwar/lidguard/releases/download/v#{version}/LidGuard-#{version}.zip"
  name "LidGuard"
  desc "Keeps a Mac awake while coding agents are working"
  homepage "https://lidguard.pages.dev/"

  depends_on macos: :sonoma

  app "LidGuard.app"

  uninstall quit: "app.lidguard.LidGuard",
            launchctl: "app.lidguard.helper",
            delete: [
              "/Library/LaunchDaemons/app.lidguard.helper.plist",
              "/Library/Application Support/LidGuard",
            ]

  zap trash: [
    "~/Library/Preferences/app.lidguard.LidGuard.plist",
    "~/Library/Caches/app.lidguard.LidGuard",
  ]
end
