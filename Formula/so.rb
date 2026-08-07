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
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-darwin-arm64.tar.gz"
      sha256 "9fdbcadc94cc1f3a8bb490889ca63eb8e8f961f76cb719acef69d386692db6e6"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-darwin-amd64.tar.gz"
      sha256 "dac877e4b5ba95087d653f1d700571ee39c8151259ca9626b0705146861a0958"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-arm64.tar.gz"
      sha256 "90be6864d7947bab9ec8c50e83d197439678c45b2c34fd0b5755984589685224"
    end
    on_intel do
      url "https://github.com/ishanjainn/superopen/releases/download/cli-#{version}/so-linux-amd64.tar.gz"
      sha256 "54071edc5a2587b3fe6d06aba06fc894599be978430587cf079c93b5d334f623"
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
