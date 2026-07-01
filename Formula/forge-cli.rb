class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.0-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-7796efb-darwin-x64.tar.xz"
      sha256 "40e55bbdefe7e05b31e82e71336bd6ee31233f8b901365dc741283ee9359ae70"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-7796efb-darwin-arm64.tar.xz"
      sha256 "61002a09665b90bb5aa7d030590ea5a9b449933fc03414b31aecd21d1fb15c16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-7796efb-linux-x64.tar.xz"
      sha256 "db06ae28da6172ccf4cd3d7135230e37e54e8bcacd4ffe7578168176f7d05e2d"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-7796efb-linux-arm64.tar.xz"
      sha256 "2a8cd5d6dfb81923ae7f1a4691a97695e4d78cb78e7983536f78b1021309f471"
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
