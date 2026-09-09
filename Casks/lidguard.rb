cask "lidguard" do
  version "1.2"
  sha256 "8ec68020b4dec361e204657b971abd61bfe6c939ba477ff14f57d35b3df19795"

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
