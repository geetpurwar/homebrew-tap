cask "lidguard" do
  version "1.1.1"
  sha256 "86b4fa3dddeafd0bb9a3e164970b7f84735632ac9d0f8d6833eac44005185741"

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
