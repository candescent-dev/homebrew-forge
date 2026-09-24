class ForgeCli < Formula
  desc "Candescent CLI — build, submit, and manage extensions"
  homepage "https://docs.candescent.com"
  version "1.0.4-beta"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.4-beta/forge-v1.0.4-beta-eb6e342-darwin-x64.tar.xz"
      sha256 "2a8d508583bbf52d0f19b7797b7785b831a7fb1318e470ff8971cebd49f5cb59"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.4-beta/forge-v1.0.4-beta-eb6e342-darwin-arm64.tar.xz"
      sha256 "6705f42349f79430eb48a1e58320b87f1f52e6a8247c22669cd280f0df1eb3f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.4-beta/forge-v1.0.4-beta-eb6e342-linux-x64.tar.xz"
      sha256 "af4c4a5fcccc9096fdae4f7f7ae5a32fec0e564a0b9e63210807e34de68b9880"
    end
    on_arm do
      url "https://github.com/candescent-dev/homebrew-forge/releases/download/v1.0.4-beta/forge-v1.0.4-beta-eb6e342-linux-arm64.tar.xz"
      sha256 "5246084f2f4624838752b8fba783bb92444f9cc4733472fb7d74656adbf2ca01"
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
