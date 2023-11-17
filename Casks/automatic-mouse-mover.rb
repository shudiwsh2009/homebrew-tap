cask "automatic-mouse-mover" do
  version "1.3.0"
  sha256 "0d152d6cfd114951e21c519b5d5458be7d7bca8dd1207b8990279879fa7b3112"

  url "https://github.com/prashantgupta24/automatic-mouse-mover/releases/download/v#{version}/amm.x86.zip", 
    verified: "github.com/prashantgupta24/automatic-mouse-mover"
  name "Automatic Mouse Mover"
  desc "a minimalistic go library/app to keep your mac active and alive"
  homepage "https://github.com/prashantgupta24/automatic-mouse-mover"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :high_sierra"

  app "amm.app"

  uninstall quit: "com.pg.amm"

  zap trash: [
    "~/Library/Preferences/com.pg.amm.plist",
  ]
end