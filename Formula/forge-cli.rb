class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.2-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.2-beta/forge-v1.0.2-beta-4613c13-darwin-x64.tar.xz"
      sha256 "6bc3e0d349af5f0513439f7bcec4d8a138385340590010ce89bb6d799cb618f0"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.2-beta/forge-v1.0.2-beta-4613c13-darwin-arm64.tar.xz"
      sha256 "1fd25bdd10832a68df4f728f3d75b9f545572c53cff505ed6517e088ee33e51e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.2-beta/forge-v1.0.2-beta-4613c13-linux-x64.tar.xz"
      sha256 "23805e1a3fc8530c2427636956d2d6d0b4c36787953ca20e6bc5a2706bfe2b19"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.2-beta/forge-v1.0.2-beta-4613c13-linux-arm64.tar.xz"
      sha256 "eadddfdedcb9ab92f6334439fb6e0c13348138d211f605ac6ce378be89944459"
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
