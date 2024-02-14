cask "dotnet-sdk6" do
	arch arm: "arm64", intel: "x64"

	on_intel do
		version "6.0.419,bede9a7c-0980-45a2-b9fd-3477827dfb1e,9c132e3a5ea9d26840f015a957ee1248"
		sha256 "a6c44fca17a990b00a9701340cb051915aa73bd82f95f5d23ae4c9c6e0e6ec53"
	end
	on_arm do
		version "6.0.419,9be72207-eade-45b0-92a9-d48725770f61,8890ebc6575287d598c7139f90cdc2ca"
		sha256 "8c76457c304c3226c5cf17698c164d79b2d66dd9f52aa71ae86dcfad03edfd61"
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