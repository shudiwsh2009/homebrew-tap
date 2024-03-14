cask "dotnet-sdk6" do
	arch arm: "arm64", intel: "x64"

	on_intel do
		version "6.0.420,0e01a0d5-70de-4872-9e17-ac810a2d0325,b1cdf50516e6a6fc9e413164e93a5934"
		sha256 "ba02db1e7e608d6043d226df75730f3d23ce6b6b8a3599675ae4629726fad8ae"
	end
	on_arm do
		version "6.0.420,765a8b03-083e-4ae0-a468-3025f7025d8c,6d90637617f28810ec3abe148a051d3f"
		sha256 "b0d3f4fe83dd47fadabbf6eeb6175f3b52b127f4dd474e90e3d006bf3d17b127"
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