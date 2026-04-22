class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "0.1.0-beta.1"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-ca03a57-darwin-x64.tar.xz"
      sha256 "5ff9981218eab46073e5bdd500f51778e665239ca3d7fd4b7fbc291e0d34ff1b"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-ca03a57-darwin-arm64.tar.xz"
      sha256 "8a0a3f23fefdb7537e3695edeefbfa1fe0a26b70cb266d475a5df7b5d83b77b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-ca03a57-linux-x64.tar.xz"
      sha256 "78ff5948284556d922685db630109636cf3cd43a0b388bc32f518be17b5eebbd"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v0.1.0-beta.1/forge-v0.1.0-beta.1-ca03a57-linux-arm64.tar.xz"
      sha256 "abfe982c37c4851fe56b28792c511e7c088ec35cac4241b8aef6c9b6ef93043c"
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
