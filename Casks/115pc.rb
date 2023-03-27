cask "115pc" do
    version "2.0.5.5"
    sha256 "083ec6ab9db521505e260a6777dfd175e0493378f625e0c1310fc2b6c478eb2d"
  
    url "https://down.115.com/client/115pc/mac/115pc_#{version}.dmg"
    name "115pc"
    name "115电脑版"
    desc "115全新PC客户端"
    homepage "https://pc.115.com/index.html"
  
    livecheck do
      url "https://appversion.115.com/1/web/1.0/api/chrome?callback=get_version"
      regex(/115pc_(\d+(\.\d+)+).dmg/i)
    end
  
    depends_on macos: ">= :high_sierra"
  
    app "115电脑版.app"

    uninstall quit: "org.115pc.115Desktop"
  
    zap trash: [
      "~/Library/Application Support/115",
      "~/Library/Application Support/115DocViewer",
      "~/Library/Application Support/115Player",
      "~/Library/Caches/115",
      "~/Library/Caches/org.115pc.115Desktop",
      "~/Library/Preferences/org.115pc.115Desktop.plist",
      "~/Library/Saved Application State/org.115pc.115Desktop.savedState",
      "~/Library/Saved Application State/org.115pc.115DocViewer.savedState",
    ]
  end