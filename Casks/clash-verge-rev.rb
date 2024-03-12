cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.7"
    sha256 arm:   "322d311a560488bab25ca0950ff68dcf5ccc021480d51700019d75c6aaf1bebc",
           intel: "6b52c9331f51f32931e3e4e7723cf6ac4e8b0f9e6e3117238bfb5cccecbcaa93"
           
	url "https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
	name "Continuation of Clash Verge"
	desc "A Clash Meta GUI based on Tauri."
	homepage "https://github.com/clash-verge-rev/clash-verge-rev"

	livecheck do
        url :url
        strategy :github_latest
    end

    auto_updates true
	depends_on macos: ">= :catalina"

    app "Clash Verge.app"

    uninstall quit:      "io.github.clash-verge-rev.clash-verge-rev"
    
    zap trash: [
        "~/Library/Caches/io.github.clash-verge-rev.clash-verge-rev",
        "~/Library/Preferences/io.github.clash-verge-rev.clash-verge-rev.plist",
        "~/.config/clash-verge/",
    ]
end