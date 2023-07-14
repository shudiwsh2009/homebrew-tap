cask "dotnet-sdk6" do
	arch arm: "arm64", intel: "x64"

	on_intel do
		version "6.0.412,29422c7c-896f-489e-ae47-d8a343b105c2,123a90e25f0260d92ec192877c5bc7cf"
		sha256 "fd24a9fbbb9db60c7c67bf8ca76340b719627dc17b4130afead88b8b807166bf"
	end
	on_arm do
		version "6.0.412,298ca4ac-bcb3-4be3-9cb2-b3e57021ff66,b3fa8311e2c3ef1401885c15a492a8c0"
		sha256 "8f919fda9e50635f56aac3d97f13e0916c6b973689baeac49ce8556050f56d87"
	end

	url "https://download.visualstudio.microsoft.com/download/pr/#{version.csv.second}/#{version.csv.third}/dotnet-sdk-#{version.csv.first}-osx-#{arch}.pkg"
	name ".NET SDK"
	desc "Developer platform"
	homepage "https://www.microsoft.com/net/core#macos"

	livecheck do
		cask "dotnet"
		regex(%r{/download/pr/([^/]+)/([^/]+)/dotnet-sdk-v?(\d+(?:\.\d+)+)-osx-#{arch}\.pkg}i)
	end

	conflicts_with cask: [
		"dotnet",
		"dotnet-sdk",
		"homebrew/cask-versions/dotnet-preview",
		"homebrew/cask-versions/dotnet-sdk-preview",
	], formula: [
		"dotnet",
		"dotnet@6",
	]
	depends_on macos: ">= :mojave"

	pkg "dotnet-sdk-#{version.csv.first}-osx-#{arch}.pkg"
	binary "/usr/local/share/dotnet/dotnet"

	uninstall	pkgutil: [
					"com.microsoft.dotnet.*",
					"com.microsoft.netstandard.pack.targeting.*",
				],
				delete:  [
					"/etc/paths.d/dotnet",
					"/etc/paths.d/dotnet-cli-tools",
				]

	zap trash: [
		"~/.dotnet",
		"~/.nuget",
	]
end