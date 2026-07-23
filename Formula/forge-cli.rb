class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.1-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.1-beta/forge-v1.0.1-beta-608713f-darwin-x64.tar.xz"
      sha256 "16d9d3b9511f77eb095cd87a874c92be5c2942eed2374b9156834764068b117f"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.1-beta/forge-v1.0.1-beta-608713f-darwin-arm64.tar.xz"
      sha256 "4454fc7b65e11086b8318a76b62250c3e85c2d2c279af4c1eabd00b93034f02f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.1-beta/forge-v1.0.1-beta-608713f-linux-x64.tar.xz"
      sha256 "0a3890ea40b5546ea568a00c4527734362aa620133baff45da5523962092bb5b"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.1-beta/forge-v1.0.1-beta-608713f-linux-arm64.tar.xz"
      sha256 "32fa401563a4d99c62ceebd00215efb2c817636651c24ec0dafd21d626bfec44"
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
