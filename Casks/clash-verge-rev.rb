cask "clash-verge-rev" do
	arch arm: "aarch64", intel: "x64"
    version "1.5.11"
    sha256 arm:   "da5723ba3b5b4a1bd0223c25fc6c2bbf46c18efb7f4f01fb596e7cd4cb6fc0d8",
           intel: "5475cbc96eae4cda81660e4ee35138a02171a5f21daea9b5a4d73852a83eebce"
           
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