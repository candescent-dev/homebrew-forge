class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.3-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.3-beta/forge-v1.0.3-beta-d76f2b3-darwin-x64.tar.xz"
      sha256 "31f5d3b10c6ad44f7dedfadf027e06d6e77a8807e606da1832fe5313cb8cae0e"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.3-beta/forge-v1.0.3-beta-d76f2b3-darwin-arm64.tar.xz"
      sha256 "906e720556e085fd97708e1e9734635a93dec71347b9ef3d04ba59e80f301b91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.3-beta/forge-v1.0.3-beta-d76f2b3-linux-x64.tar.xz"
      sha256 "a6239cd72bdfb762d176b1d5b89e43b7f3141f0a954a2e01958653d3fb891905"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.3-beta/forge-v1.0.3-beta-d76f2b3-linux-arm64.tar.xz"
      sha256 "29808a086f661cca975aa57f1beb587e9daac37816c5715b2c93af3fefc40b65"
    end
  end

  def install
    # Point oclif's self-update lookup at a path that never exists so
    # that `forge update` does not shadow the brew-managed binary.
    # See bin/forge in the tarball: CLIENT_HOME=${FORGE_OCLIF_CLIENT_HOME:=…}
    inreplace "bin/forge", /^CLIENT_HOME=/,
      "export FORGE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/forge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/forge --version")
  end
end
