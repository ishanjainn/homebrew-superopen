# Homebrew formula for the Superopen CLI (`so`).
#
# This file is bumped automatically by the `homebrew` job in
# ishanjainn/superopen's .github/workflows/release-cli.yml on every
# cli-*.*.* release (via dawidd6/action-homebrew-bump-formula).
#
# Manual install:
#   brew install ishanjainn/superopen/so
class So < Formula
  desc "Superopen - harness engineering for AI coding agents"
  homepage "https://github.com/ishanjainn/superopen"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-darwin-arm64.tar.gz"
      sha256 "PENDING_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-darwin-amd64.tar.gz"
      sha256 "PENDING_FIRST_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-arm64.tar.gz"
      sha256 "PENDING_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-amd64.tar.gz"
      sha256 "PENDING_FIRST_RELEASE"
    end
  end

  head do
    url "https://github.com/ishanjainn/superopen.git", branch: "main"
    depends_on "go" => :build
  end

  def install
    if build.head?
      system "go", "build", "-o", bin/"so", "./cmd/so"
    else
      bin.install Dir["so*"].first => "so"
    end
  end

  test do
    assert_match "so", shell_output("#{bin}/so --help")
  end
end
