# https://github.com/morooi/homebrew-xray/blob/main/Formula/xray.rb
class Xray < Formula
  desc "Xray, Penetrates Everything. Also the best v2ray-core, with XTLS support. Fully compatible configuration."
  homepage "https://xtls.github.io/"
  version "1.8.7"
  on_intel do
    url "https://github.com/XTLS/Xray-core/releases/download/v#{version}/Xray-macos-64.zip"
    sha256 "f4bb203eac32d203bdf7b4576bd7a29fdece38b653379ae6b6cf456dea8bb1f1"
  end
  on_arm do
    url "https://github.com/XTLS/Xray-core/releases/download/v#{version}/Xray-macos-arm64-v8a.zip"
    sha256 "95ae44b16907c8f9f8a123d454b92caf04a4686ac950d422f3909545a79f2149"
  end
  license "MPL-2.0"

  resource "config" do
    url "https://raw.githubusercontent.com/XTLS/Xray-examples/main/VLESS-TCP-XTLS-Vision/config_client.json"
  end

  resource "geoip" do
    url "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geoip.dat"
  end

  resource "geosite" do
    url "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geosite.dat"
  end

  def install
    bin.install "xray"

    resource("config").stage do
      pkgetc.install "config_client.json" => "config.json"
    end

    resource("geoip").stage do
      pkgshare.install "geoip.dat"
    end

    resource("geosite").stage do
      pkgshare.install "geosite.dat"
    end
  end

  def caveats
    <<~EOS
      Create your config at #{etc}/xray/config.json
      You can get some example configs at https://github.com/XTLS/Xray-examples
    EOS
  end

  service do
    run [opt_bin/"xray", "run", "--config", "#{etc}/xray/config.json"]
    run_type :immediate
    keep_alive true
  end

  test do
    system "#{bin}/xray", "version"
  end
end