cask "lidguard" do
  version "1.1"
  sha256 "29fd459d0ee01101271f5ec67a49240fb98b5246a7d2e9f6ddc17a77b27cebb4"

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
