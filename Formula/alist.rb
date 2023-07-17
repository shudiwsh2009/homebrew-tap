class Alist < Formula
  desc "A file list program that supports multiple storage, powered by Gin and Solidjs."
  homepage "https://alist.nn.ci/"
  version "3.22.1"
  on_intel do
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
    sha256 "8dd7ffdd97dfd3f7d73134bb153fa6851b6d0725bd3fdb8f754c87c3a87643d4"
  end
  on_arm do
    url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
    sha256 "94225e24f6e93e7a74ffc67ad3f285c7f0aba63114c74a33e1f6297a2ca0a784"
  end
  license "AGPL-3.0"

  def install
    bin.install "alist"
  end

  service do
    run [opt_bin/"alist", "server", "--data", "#{etc}/alist/data"]
    run_type :immediate
    keep_alive true
  end
end
