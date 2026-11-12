class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.2.0-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.2.0-beta/forge-v1.2.0-beta-82e0814-darwin-x64.tar.xz"
      sha256 "8c7c2dd79228518227b7b1114606b1116c1983dea18cf07595d6bb9d4e8ad41e"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.2.0-beta/forge-v1.2.0-beta-82e0814-darwin-arm64.tar.xz"
      sha256 "88889033315641392673fb0ad295b4a0c618b34f8995131f0fbebf6c384651be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.2.0-beta/forge-v1.2.0-beta-82e0814-linux-x64.tar.xz"
      sha256 "52a43cf042f477695f4ad956a470eab0e34ece25cdc76105dace3fa3775283b0"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.2.0-beta/forge-v1.2.0-beta-82e0814-linux-arm64.tar.xz"
      sha256 "571658de211304d7f84582640023d15f10c13e2ae9663cbc83132c1605b06f65"
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
