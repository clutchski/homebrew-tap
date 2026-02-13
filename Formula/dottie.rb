class Dottie < Formula
  desc "A dotfiles manager for macOS and Linux"
  homepage "https://github.com/clutchski/dottie"
  url "https://github.com/clutchski/dottie/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b41493ab6582a5dcbb3648ce79aaa70941dc04010b07b573325a5802071ef368"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=HEAD
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/dottie"
  end

  test do
    system "#{bin}/dottie", "version"
  end
end
