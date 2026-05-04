class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.6"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.6/forge-v0.1.0-beta.6-4a22648-darwin-x64.tar.xz"
      sha256 "d72e88e61eb2e935f836eac3415260219831623dfd5fa90c0cf1b1c19b0bde47"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.6/forge-v0.1.0-beta.6-4a22648-darwin-arm64.tar.xz"
      sha256 "e996c7e50906216b5b1cc74b4380e11cc3b28b410c8de9cc16df688d60fd536e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.6/forge-v0.1.0-beta.6-4a22648-linux-x64.tar.xz"
      sha256 "4bd00112a339aedfeb62e9f47a9deb5ba075f80822dc8f0529455cca69a925fd"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.6/forge-v0.1.0-beta.6-4a22648-linux-arm64.tar.xz"
      sha256 "112ee0c10f90d455081df030b7d573e76cb85a776fb209401795398358a05fb5"
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
