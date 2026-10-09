cask "revoke" do
  version "1.1.5"
  sha256 "77a2ccea2fb9c1469f286b31b9768308f1a804e6b87b29b73746743e7a6c8443"

  url "https://github.com/benjweaver/revoke/releases/download/v#{version}/Revoke-#{version}.zip"
  name "Revoke"
  desc "Takes back AI agents' Device Control, Screen Recording, and Local Network access"
  homepage "https://github.com/benjweaver/revoke"

  depends_on macos: :sequoia

  app "Revoke.app"

  # Stop the running copy on uninstall and upgrade. A signal rather than `quit:`,
  # which would ask for Automation access; Revoke has nothing to save.
  uninstall signal: [["TERM", "dev.benjweaver.Revoke"]]

  zap trash: [
    "~/Library/Caches/dev.benjweaver.Revoke",
    "~/Library/Preferences/dev.benjweaver.Revoke.plist",
  ]

  caveats <<~EOS
    Before uninstalling, choose Give All Links Back and Remove Network Filter in
    Revoke's settings, so every app opens its own links again and the network
    filter, a system extension, is removed as well. From a script:
      /Applications/Revoke.app/Contents/MacOS/Revoke --restore-links
  EOS
end
