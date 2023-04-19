cask "automatic-mouse-mover" do
  version "1.2.0"
  sha256 "61b509e5c7e2bc7cb4a2db2077cbc0ffb822cd92a4528bf7e9791e2e7bdb97ec"

  url "https://github.com/prashantgupta24/automatic-mouse-mover/releases/download/v#{version}/amm.app.zip", 
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