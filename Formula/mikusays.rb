class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.1/mikusays-macos-arm64"
      sha256 "882c758141b5b9062518a2ebedbc179ddf85457556cf2e3c8763dfcdc4b48d4e"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.1/mikusays-macos-x64"
      sha256 "19a5a9e2348a16a1801e41b084d4520a8ad509b15a2803d8550aaf7a595711cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.1/mikusays-linux-arm64"
      sha256 "6417bca50ef4f4ed61f5233670274916cf77e866ff83c235dc64626001a40869"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.1/mikusays-linux-x64"
      sha256 "a9b409e1d14256417e2db12c6cbc61b20d62afd37d6d3e2708a02aa3c1a06bd0"
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
