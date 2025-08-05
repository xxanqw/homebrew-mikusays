class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.2/mikusays-macos-arm64"
      sha256 "44c8c196a7f2c2dd19a1d8317f5a606b685d5d84a6ea7b69e4f55d98b7eeaca1"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.2/mikusays-macos-x64"
      sha256 "30d3df43d51e64e67bee74936e80f0975295ee4786ae2aea4c444544e507333a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.2/mikusays-linux-arm64"
      sha256 "a87e0f765b140b12284f2bd2fc6abeda6feab52245b413e074eae495ca09a0d6"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.2/mikusays-linux-x64"
      sha256 "ba16cda3572ac1097cae53f042ffacd6883d9c38f2a5c708301c76b8f5d0a95d"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "mikusays-macos-arm64" => "mikusays"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "mikusays-macos-x64" => "mikusays"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "mikusays-linux-arm64" => "mikusays"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "mikusays-linux-x64" => "mikusays"
    end
  end

  test do
    assert_match "hello", shell_output("#{bin}/mikusays hello")
  end
end
