cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.6.2"
    sha256 arm:   "143845fc0aea88b8ebcfec9e9a9b968f056c5472d92fc5d606347aca79a9fcb2",
           intel: "9b599dbbe16e95b98c6eeb773fbedc00dc1d9a8d83b1bb4baa5f2753c6e852b1"
           
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