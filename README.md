# Homebrew tap for Revoke

[Revoke](https://github.com/benjweaver/revoke) shows which apps have Device Control,
Screen Recording, and Local Network access on your Mac, and takes it back from AI
agents with one click. It's free, open source, and has no telemetry.

```sh
brew install --cask benjweaver/revoke/revoke
```

Revoke is signed with a Developer ID and notarized by Apple, so macOS opens it without
a warning. Before uninstalling, choose **Remove Network Filter** in Revoke's settings,
so its network filter goes too.

`scripts/update-cask.sh` points `Casks/revoke.rb` at a release, the latest by default.
Revoke's release script runs it and pushes the result here, which starts the install test.
