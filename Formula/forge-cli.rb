class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.1"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-fa8df2c-darwin-x64.tar.xz"
      sha256 "b4c4da630b73820547228392df1d7db6e8c00c15768897ca8a27ce5ef2d9bb26"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-fa8df2c-darwin-arm64.tar.xz"
      sha256 "5aa9db28d6ee2c23a9e9d57ec198c80274eb5668da909289893e72a3b118e3e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-fa8df2c-linux-x64.tar.xz"
      sha256 "381f487e6fa0068be24f364c02467e61deb232613d0f77bc27c4544f0f897986"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-fa8df2c-linux-arm64.tar.xz"
      sha256 "4944577787f0ce3f96dfb458f96bd14afa40ba0d22406ae821c8ec375c6e3c9f"
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
