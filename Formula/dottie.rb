class Dottie < Formula
  desc "A dotfiles manager for macOS and Linux"
  homepage "https://github.com/clutchski/dottie"
  url "https://github.com/clutchski/dottie/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c2b7ff71a3f2de502c4dbda264b379558c8cc30546273de82d68c5c94f9ea097"
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
