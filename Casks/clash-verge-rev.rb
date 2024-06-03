cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.6.4"
    sha256 arm:   "bfc0752e70c951890d912837929392979de1a628cfa1ca1536f6b1ef8f4ba852",
           intel: "6ff12a8a1970ad65fb8ce38e5f5ba97880526d49f7f04eeb000ad8e09103df5f"
           
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