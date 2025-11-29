class Mikusays < Formula
  desc "Like cowsay but with Hatsune Miku"
  homepage "https://github.com/xxanqw/mikusays"
  version "0.1.4-2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.4-2/mikusays-macos-arm64-0.1.4-2"
      sha256 "838b0b704f57c31f4e51bfe4b4699a51224565a136d7b85854a33af9ff86bb7a"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.4-2/mikusays-macos-x64-0.1.4-2"
      sha256 "8637a8954e19f0acd4af1e63cf30e3c2d696def3a0901f435191076855c28fcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.4-2/mikusays-linux-arm64-0.1.4-2"
      sha256 "651bfdcce5942096df7e5de726d676acb28c4ec54321d390cbb635e5fb6914ca"
    elsif Hardware::CPU.intel?
      url "https://github.com/xxanqw/mikusays/releases/download/v0.1.4-2/mikusays-linux-x64-0.1.4-2"
      sha256 "1371a8be0db49c5ea010f1ed928b873fb5d7e16e07631f4ef27e346180c7c3d8"
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
