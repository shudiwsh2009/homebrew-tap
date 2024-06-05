cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.6.5"
    sha256 arm:   "10a88bdfcba942cb53567bc89efdc9f7cf1a5ed43437460f7e9c8f1d6de1bc80",
           intel: "6810c7f697c6ccbd6d38ac2ac3194d759c1ba97041cb217b6dfa8470af3ae069"
           
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