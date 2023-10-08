cask "dotnet-sdk6" do
	arch arm: "arm64", intel: "x64"

	on_intel do
		version "6.0.414,1de3975a-e76b-4524-9584-b01d2c8db33e,4a05072624690d3b0167493cbb3d7757"
		sha256 "0bb807630047ec7afc4014b810bf4d859e0d7a5637996959a5efb4f72efee95d"
	end
	on_arm do
		version "6.0.414,6936c1ed-530d-4b1d-898e-1f27e5109c5a,a8f73f24b9103d0a64ca42f1462b0954"
		sha256 "ac440601e3bef9bf824958df5288e44e5e9e0e32f3b6fd7ecb2022f29a7a5dcb"
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