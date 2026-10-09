cask "revoke" do
  version "1.1.2"
  sha256 "a55ccba96b6b04743236f37c49cd4631a41b4c727d38654a84004d7f39ad151a"

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
