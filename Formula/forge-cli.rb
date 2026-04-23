class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.5"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-eeaf8f4-darwin-x64.tar.xz"
      sha256 "2f57c45b7960030aa1d088a1f9b3a7c76b16f38274731312fc863ea533b1d2df"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-eeaf8f4-darwin-arm64.tar.xz"
      sha256 "f0a08338f125cc43af15686017f5240a2e92e3a0ac3603e9cb2c83d27b143d89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-eeaf8f4-linux-x64.tar.xz"
      sha256 "34b6085175188ada71b6bb3c05471edcab0658f8a52f71decb94d0fefc7ceed4"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-eeaf8f4-linux-arm64.tar.xz"
      sha256 "e57b5a1de6aa9b4dd4baafdda19ee06aaea865d05a35ef8542414593d87f88c1"
    end
  end

  def install
    inreplace "bin/forge", /^CLIENT_HOME=/,
      "export FORGE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/forge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/forge --version")
  end
end
