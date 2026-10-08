class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.1.0-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.1.0-beta/forge-v1.1.0-beta-6b50d2c-darwin-x64.tar.xz"
      sha256 "10bd73d2654f410771ecbe6dedab0748ad469f35093b5763e0e98c00d9f972c3"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.1.0-beta/forge-v1.1.0-beta-6b50d2c-darwin-arm64.tar.xz"
      sha256 "fafcc740a1885297d64be1a60dd1a703c47b098110b39dd7c8b0d67abd6185e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.1.0-beta/forge-v1.1.0-beta-6b50d2c-linux-x64.tar.xz"
      sha256 "d660909cbf5c1eeb091b1c30b7111553006c2922fa2852330e7016bf1b30d9e6"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.1.0-beta/forge-v1.1.0-beta-6b50d2c-linux-arm64.tar.xz"
      sha256 "fd0e8095c19a9f06936012bb7e2140b0ee4f830bc01c36097eb27e066f0792db"
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
