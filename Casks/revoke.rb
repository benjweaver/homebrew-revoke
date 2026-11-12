cask "revoke" do
  version "1.6.2"
  sha256 "273a1da434c36d90891625f832a11016467f08475aa07b9d767c5a6ec512a511"

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
