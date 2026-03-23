class AiProviders < Formula
  desc "Manage AI tool configuration profiles"
  homepage "https://github.com/Albert556/ai-providers"
  url "https://github.com/Albert556/ai-providers/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f4f71634359d665a521137e4ea8cf6efaf9f6609649256ab3a1b01197356096f"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    generate_completions_from_executable(
      bin/"aip", "completion",
      shells: [:bash, :zsh, :fish, :pwsh]
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aip --version")
    assert_match "_aip", shell_output("#{bin}/aip completion zsh")
  end
end
