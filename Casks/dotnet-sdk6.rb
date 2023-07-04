cask "dotnet-sdk6" do
	arch arm: "arm64", intel: "x64"

	on_intel do
		version "6.0.411,a91e812a-f286-4b1b-b050-f9612c4f5ec9,dd24f826e0c99945066987df1f7ec790"
		sha256 "fe4ee80a4c823eb30ea75f37392dd1fa3423ee42eba09af3680eec747e54d8f5"
	end
	on_arm do
		version "6.0.411,1b86cb38-768d-47af-a9c0-7bc78e1cae84,d45528a6916f85bfcde29d2794139087"
		sha256 "a0e8a5aeb3e65e3a6609e0108d17e29df8e8106de51b593d66744f81c9de0b05"
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