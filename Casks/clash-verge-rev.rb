cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.6"
    sha256 arm:   "d42cc82b8ef69154d71022d89f9da80c7d3105b502dcc485def17a16506ae0f9",
           intel: "b01cbd7c301a4d089229ec02bc382709052a03bd0ae700529e8153f03f321de4"
           
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