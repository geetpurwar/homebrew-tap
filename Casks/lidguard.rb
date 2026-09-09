cask "lidguard" do
  version "1.2.1"
  sha256 "4bede09051bdcdb40c7a0b14f18d33fe024cd74e2fedfc50223b0b5e95cae710"

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
