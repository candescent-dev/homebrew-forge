class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.1"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-f68bb36-darwin-x64.tar.xz"
      sha256 "18068647c230289335bb1e9beabee38755f0e2ae7bed132ec0505d68d8978c2c"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-f68bb36-darwin-arm64.tar.xz"
      sha256 "f5b3a662049515b3f0e5978a077950038dc200685de11fd4bc9b95b92ff91aab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-f68bb36-linux-x64.tar.xz"
      sha256 "33cb1a0b2cc3b31e617dc288da15f31269224d2b0495f4f27691f07229dbd28f"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-f68bb36-linux-arm64.tar.xz"
      sha256 "63e2842a506880ad6fb672df95eaea61c99d2d43a9ec4a0799c772aee5421e04"
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
