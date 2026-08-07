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
      sha256 "e3789e42a5015df2e81be244d8d6d2d4c597a0799f5823ac891b84c0fa37e684"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-darwin-amd64.tar.gz"
      sha256 "d4a0fb5c740097498e52176b0bd926426d01a6b8b226bc74345d46fed74cd517"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-arm64.tar.gz"
      sha256 "90bb771bf66c95fb64a0f011e37c0494aea191bc277bb833f55ec9017e7955a1"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-amd64.tar.gz"
      sha256 "064a520b93781bce632ad96c8e02b55cdda1cd278dd7a8f155cd0780409c95ee"
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
