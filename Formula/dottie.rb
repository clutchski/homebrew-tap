class Dottie < Formula
  desc "A dotfiles manager for macOS and Linux"
  homepage "https://github.com/clutchski/dottie"
  url "https://github.com/clutchski/dottie/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "37e1f2db70ed21a07715d80d78fe1745304eeee01ae57ae233360fa397649bd6"
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
