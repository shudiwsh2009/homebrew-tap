cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.10"
    sha256 arm:   "e8aa3c43e8aa8b0e57beeab9571a65b7089bd1781b0bb441ca97c3aa91b2d55a",
           intel: "c4069d134420d0fa27babe0c03d9a02371c948169c94003075d5665e48aa226f"
           
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