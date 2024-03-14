cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.8"
    sha256 arm:   "e37432e83794115564b4a3cb3768b0a8c4bbad712d90eb9591459a6e3ec76a0d",
           intel: "1af8915bbb3f134ea98c74563057c81f0da24e350116ecf5694f3706a867d7f4"
           
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