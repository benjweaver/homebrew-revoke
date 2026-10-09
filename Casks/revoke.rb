cask "revoke" do
  version "1.1.0"
  sha256 "3cf2ba124bee6c235c67e2122d83b58d0a3f209151131d4febd97843a99a2056"

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
    Before uninstalling, choose Remove Network Filter in Revoke's settings, so
    its network filter, a system extension, is removed as well.
  EOS
end
