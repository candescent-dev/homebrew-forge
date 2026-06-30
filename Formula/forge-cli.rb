class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.0-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-6798279-darwin-x64.tar.xz"
      sha256 "9efc9c447e91ef6a0a33865830bc4d7a8d3b1739c389d111bf88c808a0c3bdff"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-6798279-darwin-arm64.tar.xz"
      sha256 "ee25aaabdb4653bcd61a565150d11251e8f641285a247c53d42305f53ca1286d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-6798279-linux-x64.tar.xz"
      sha256 "5e2d056d12e0fa17d3bf754fdf10bc72fca48dcf3247c7290754b6f8ffd0be0d"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.0-beta/forge-v1.0.0-beta-6798279-linux-arm64.tar.xz"
      sha256 "fbe70d0cfaf06fe7e3e690ff92002b635f5266d7ca7e4187e0e324390977ffa8"
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
