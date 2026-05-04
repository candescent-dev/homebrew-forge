class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.5"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-1840a45-darwin-x64.tar.xz"
      sha256 "817d5d461dcc572c6459dd4522d42677df812fde661862834329e90688191a77"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-1840a45-darwin-arm64.tar.xz"
      sha256 "c07f1ed8a96d40a6906aeb1577173b356da5e21108715a50a99890c85e72867c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-1840a45-linux-x64.tar.xz"
      sha256 "6b9e757681b91c47722b31a2efac170aee17f4a95db9fbd47d390f816851907e"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.5/forge-v0.1.0-beta.5-1840a45-linux-arm64.tar.xz"
      sha256 "e15a62f7121e7ce92b5496bfb3448703c901706f180b37785c6dc1c5665e44c6"
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
