class AiProviders < Formula
  desc "Manage AI tool configuration profiles from the command line"
  homepage "https://github.com/Albert556/ai-providers"
  version "1.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Albert556/ai-providers/releases/download/v1.1.1/aip-v1.1.1-aarch64-apple-darwin"
      sha256 "2c081a6fa0d3b80a48deb7f4e1371befb61066db87a02dea8e27a8e0cfcf5cf8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Albert556/ai-providers/releases/download/v1.1.1/aip-v1.1.1-x86_64-unknown-linux-gnu"
      sha256 "2ddbe51bb87cf02e8c520d8ee97f11e70510044710ce83ccd9157c72e65adebf"
    end
  end

  def install
    if OS.mac?
      bin.install "aip-v#{version}-aarch64-apple-darwin" => "aip"
    elsif OS.linux?
      bin.install "aip-v#{version}-x86_64-unknown-linux-gnu" => "aip"
    end

    generate_completions_from_executable(bin/"aip", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aip --version")
  end
end
