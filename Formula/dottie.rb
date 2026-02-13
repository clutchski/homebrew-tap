class Dottie < Formula
  desc "A dotfiles manager for macOS and Linux"
  homepage "https://github.com/clutchski/dottie"
  url "https://github.com/clutchski/dottie/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "5fe25fde1fb9c88a07f76f5627a5778beccd61ee133a4b2fcb68704d3502094f"
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
