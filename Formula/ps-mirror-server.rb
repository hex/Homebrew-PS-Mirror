# ABOUTME: Homebrew formula for PS Mirror Server
# ABOUTME: Installs WebSocket relay that bridges Photoshop to iOS

class PsMirrorServer < Formula
  desc "WebSocket relay server for PS Mirror - Photoshop to iOS preview"
  homepage "https://github.com/hex/PS-Mirror"
  url "https://github.com/hex/ps-mirror-server/releases/download/v2025.12.9/ps-mirror-server-2025.12.9.tar.gz"
  sha256 "1024c4b74bd546f80342da9f52c42d2141b08039af72b0206510a1efc5fa5bbc"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    # Install server files to libexec
    libexec.install Dir["*"]

    # Install dependencies
    cd libexec do
      system "bun", "install"
    end

    # Create wrapper script
    (bin/"ps-mirror-server").write <<~EOS
      #!/bin/bash
      exec "#{Formula["oven-sh/bun/bun"].opt_bin}/bun" "#{libexec}/server.js" "$@"
    EOS
  end

  service do
    run [opt_bin/"ps-mirror-server"]
    keep_alive true
    log_path var/"log/ps-mirror-server.log"
    error_log_path var/"log/ps-mirror-server.log"
    working_dir var
  end

  test do
    assert_match "ps-mirror-server", shell_output("#{bin}/ps-mirror-server --version")
  end
end
