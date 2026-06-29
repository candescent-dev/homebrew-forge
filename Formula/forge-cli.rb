class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.7"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-c7af3b1-darwin-x64.tar.xz"
      sha256 "238843662b2ae91de3471175c9c13d5e443022607616cde8f3dd879bb2585084"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-c7af3b1-darwin-arm64.tar.xz"
      sha256 "d2d7d5f2c2447e49833bb9828176074f6602fb5f2d3b26d4bf6a86daa6be39ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-c7af3b1-linux-x64.tar.xz"
      sha256 "7de1df506d57a002ddac99aa49d5ff9bc897f69454c44b81e8d40174ee7b9516"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-c7af3b1-linux-arm64.tar.xz"
      sha256 "948c7b9ba8cc9dab0699c5bbf27082f296ce245c955fc94facab28a507e7f093"
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
