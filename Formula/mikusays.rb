class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.0/mikusays-macos-arm64"
      sha256 "809d2df3c0d611a094756987f9531f24dff0fbef780fd51bffd93c7a0bc36bd2"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.0/mikusays-macos-x64"
      sha256 "a195c32c6b39021ed99dd4a9c52b9ee315c2697ddc6647e33950c729da72357b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.0/mikusays-linux-arm64"
      sha256 "c9e23976e81b106c95e1b9e16911178374fd6e32997f4b7d4244ac95feccde85"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.0/mikusays-linux-x64"
      sha256 "a6c5a4a94084e3375f0a556f38d07b82a86d18fc8c706b89387db6658169d720"
    end
  end

  def install
    bin.install File.basename(url) => "mikusays"
  end

  test do
    assert_match "hello", shell_output("#{bin}/mikusays hello")
  end
end