# speckeep formula — lives in the tap repo github.com/bzdvdn/homebrew-speckeep
# at Formula/speckeep.rb. Publish via:
#
#   brew tap bzdvdn/speckeep
#   brew install bzdvdn/speckeep/speckeep
class Speckeep < Formula
  desc "Lightweight Spec-Driven Development kit for development agents and humans"
  homepage "https://github.com/bzdvdn/speckeep"
  url "https://github.com/bzdvdn/speckeep/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "fad63cb800727859acd64530eb35aebf7d80564eb62659515e30e947e38ab20a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath",
           "-ldflags", "-X speckeep/src/internal/cli.Version=v#{version}",
           "-o", bin/"speckeep", "./src/cmd/speckeep"
  end

  test do
    assert_match(/v#{version}/, shell_output("#{bin}/speckeep --version"))
  end
end