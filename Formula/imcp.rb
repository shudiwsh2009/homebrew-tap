class Imcp < Formula
  desc "Node.js SDK for Model Context Protocol (MCP)"
  homepage "https://github.com/ai-microsoft/imcp"
  url "https://registry.npmjs.org/imcp/-/imcp-0.2.1.tgz"
  sha256 "e3e05edea287b8ccdb38ec8b5fa4109abc48a032095ee21996e23ce18c2fa5cd"
  license "MIT"

  depends_on "gh"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run [opt_bin/"imcp", "serve"]
    keep_alive true
    log_path var/"log/imcp.log"
    error_log_path var/"log/imcp.log"
    working_dir var
  end

  test do
    output = shell_output("#{bin}/imcp --help", 0)
    assert_match "imcp", output
  end
end
