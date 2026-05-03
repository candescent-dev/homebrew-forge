# Homebrew Tap for the Forge CLI

> ⚠️ **Pre-release beta.** The Forge CLI is currently distributed as a pre-release beta. Behavior and flags may change between betas — pin a specific version in CI/CD until GA. See [`LICENSE`](./LICENSE) for the full license terms (BSD 2-Clause for this tap's formula and scaffolding; the Forge CLI binary itself is proprietary software of Candescent, used under the [Candescent Developer Agreement](https://docs.candescent.com/guides/Legal/tcs/)).

Official Homebrew tap for the [**Forge CLI**](https://docs.candescent.com/guides/cli/overview) — the unifying command-line interface for the Candescent Forge developer experience.

The formula in this tap (`forge-cli`) is updated automatically on every Forge CLI release. Pre-built tarballs are uploaded to the [GitHub Releases](https://github.com/candescent-dev/homebrew-forge/releases) of this repository.

## Install

```bash
brew tap candescent-dev/forge
brew install forge-cli
```

Verify:

```bash
forge --version
forge --help
```

## Upgrade

```bash
brew update
brew upgrade forge-cli
```

After upgrading, refresh autocomplete so new commands appear in tab completion:

```bash
forge autocomplete --refresh-cache
rm -f ~/.zcompdump*    # zsh only
exec zsh               # zsh only — or restart your terminal
```

## Uninstall

```bash
brew uninstall forge-cli
brew untap candescent-dev/forge
```

## Supported Platforms

Pre-built tarballs are published for:

| OS    | Architectures                                          |
| ----- | ------------------------------------------------------ |
| macOS | `darwin-x64` (Intel), `darwin-arm64` (Apple Silicon)   |
| Linux | `linux-x64`, `linux-arm64`                             |

Homebrew automatically selects the right tarball for your platform.

## Documentation

The full Forge CLI documentation — prerequisites, command reference, walkthroughs, troubleshooting, and shell autocomplete setup — lives on the developer portal:

- **Overview:** https://docs.candescent.com/guides/cli/overview
- **Installation & prerequisites:** https://docs.candescent.com/guides/cli/installation
- **Quick start:** https://docs.candescent.com/guides/cli/quickstart
- **Command reference:** https://docs.candescent.com/guides/cli/command-reference
- **Troubleshooting:** https://docs.candescent.com/guides/cli/troubleshooting

## Links

- **npm package:** https://www.npmjs.com/package/@cdx-forge/cli
- **Documentation:** https://docs.candescent.com/guides/cli/overview
- **Issues / feedback:** [open an issue](https://github.com/candescent-dev/homebrew-forge/issues) on this tap repository (installation problems), or contact your Candescent representative for product feedback.

## License

Copyright © Digital First Holdings LLC d/b/a Candescent. All rights reserved.

This repository contains two categories of content with different license terms:

- **Homebrew formula and tap scaffolding** (`Formula/forge-cli.rb`, this README, CI configuration, etc.) — BSD 2-Clause License. See [`LICENSE`](./LICENSE).
- **The Forge CLI binary** downloaded and installed by the formula — proprietary software of Candescent. Its use is governed by the [Candescent Developer Agreement](https://docs.candescent.com/guides/Legal/tcs/).
