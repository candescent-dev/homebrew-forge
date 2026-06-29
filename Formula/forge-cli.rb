class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.7"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-317ce22-darwin-x64.tar.xz"
      sha256 "3232bd3239207fb0e8894a01e970d49b8ac38cdde502914472a71dbfd3d869fa"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-317ce22-darwin-arm64.tar.xz"
      sha256 "fa37b0627a58314a734649de5f981c90968ab2f2496ab1bac74354425ea819e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-317ce22-linux-x64.tar.xz"
      sha256 "fc676953d0c360ffed5618cb622808f6c624057dc3ba3cab7c5f32506ea0e755"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.7/forge-v0.1.0-beta.7-317ce22-linux-arm64.tar.xz"
      sha256 "f872343c10cdc7e108a0f2c7931c86ef62506cd90c4d06c958c7745d1b2dbe9d"
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
