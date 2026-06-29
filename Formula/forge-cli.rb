class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.7"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-f64e1a4-darwin-x64.tar.xz"
      sha256 "f80fade35a6b5cc75c0e53b12543da187f4a31ec243f3161754399f352ac3d8c"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-f64e1a4-darwin-arm64.tar.xz"
      sha256 "0a5d43f6f24ed086bd463b43005cb7334ee71dbdf54ca65a7844fcefe60afa1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-f64e1a4-linux-x64.tar.xz"
      sha256 "afad13e6984fe221dbff1a98fd44b6c41251e92fea4d77798cc33edc0d0c2b3e"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-f64e1a4-linux-arm64.tar.xz"
      sha256 "6414670ec963fd65cf538232097f094d95556abd3796e29009572f2fe2560d3f"
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
