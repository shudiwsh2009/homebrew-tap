cask "git-credential-manager" do
  arch arm: "arm64", intel: "x64"
  
  version "2.0.935"
  on_intel do
    sha256 "f74f45c922f4c3abff8e9abfc3f23077d4b5c6599a1c33080286aa3392c7ef7b"
  end
  on_arm do
    sha256 "ad0c149a42e1aa6bfddf5d78df08c677429d16c82b73039eb3824cd49b059814"
  end
  
  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version}/gcm-osx-#{arch}-#{version}.pkg"
  name "Git Credential Manager"
  desc "Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
  homepage "https://aka.ms/gcm"

  livecheck do
  url :url
    strategy :github_latest
  end
  
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "/usr/local/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: "com.microsoft.GitCredentialManager"
end