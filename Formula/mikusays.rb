class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-macos-arm64"
      sha256 "fb2d0d6d3c9fb5965f0fcea5a21ca65fab8fd823b833ca477a853a11afd002f5"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-macos-x64"
      sha256 "2deba5732f173c3bd22d5ad632cf32ec61889002c49661320b0dc7517281db33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-linux-arm64"
      sha256 "06d5f9012d6b4c9b011f148724a15affb71e5fd4a71eff908a35fa832f674e0b"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-linux-x64"
      sha256 "52a38f4ca13e90bf93b2dd90502a4c04cd8c903ed4fb9200e1f15d1d009f05d9"
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
