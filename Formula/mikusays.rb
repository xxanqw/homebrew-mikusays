class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.4/mikusays-macos-arm64-0.1.4"
      sha256 "feeaf1aa7594537db5d4d2c67c57994620bbd8aa93d76d9fbb9b0409c0e96c67"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-macos-x64-0.1.4"
      sha256 "42f02fe70de423ddef788fb8c6e06ddb622b33e9ef5de3e36184ed20bd3f4333"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-linux-arm64-0.1.4"
      sha256 "38da31364e88a6554b1210d043fb00463d09ab37eb75612f0cdfb0f48b2aea28"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.3/mikusays-linux-x64-0.1.4"
      sha256 "12e0670de5a316d17562008a079cb036d7ecc17d34588b47533aceae409860b7"
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
