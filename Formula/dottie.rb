class Dottie < Formula
  desc "A dotfiles manager for macOS and Linux"
  homepage "https://github.com/clutchski/dottie"
  url "https://github.com/clutchski/dottie/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5f03b298a74305311a358bb0f7242e1d8ad4ed822a86e3aa40c93d357ba38147"
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
