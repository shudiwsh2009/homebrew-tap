cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.4.6"
    sha256 arm:   "433ac66b08408efdd7cbbfa0394596200b2ac9b0518e22724a7644750bfa3c96",
           intel: "b952c822038b10222d9165e9fd7e4c89a2e1d3a650f41f365d94dfdc66807788"
           
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