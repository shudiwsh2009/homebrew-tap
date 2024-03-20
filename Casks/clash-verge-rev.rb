cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.9"
    sha256 arm:   "c8255335ea4a31fd687bcb4d132442263ec3a6c12eba6ccf31bd8a050aeefd07",
           intel: "c539c918766c54c0214fcdc32fddb1be8df3f74f03a35c2b1db7fbeda23ba3a9"
           
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