cask "clash-verge" do
	arch arm: "aarch64", intel: "x64"
    version "1.3.8"
    sha256 arm:   "fd8370323a695a8828d1a7487c9e74200ce36b51b324495bfba21498c6fc8c48",
           intel: "4cb0c3a0abc333af7f3253b9e2700d480128587607e072554c74db4f1ec23df4"

	url "https://github.com/zzzgydi/clash-verge/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
	name "Clash Verge"
	desc "A Clash GUI based on tauri."
	homepage "https://github.com/zzzgydi/clash-verge"

	livecheck do
        url :url
        strategy :github_latest
    end

    auto_updates true
	depends_on macos: ">= :catalina"

    app "Clash Verge.app"

    uninstall quit:      "top.gydi.clashverge"
    
    zap trash: [
        "~/Library/Caches/top.gydi.clashverge",
        "~/Library/Preferences/top.gydi.clashverge.plist",
        "~/.config/clash-verge/",
    ]
end