class AiProviders < Formula
  desc "Manage AI tool configuration profiles from the command line"
  homepage "https://github.com/Albert556/ai-providers"
  version "1.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Albert556/ai-providers/releases/download/v1.1.2/aip-v1.1.2-aarch64-apple-darwin"
      sha256 "5171ba7304da4c0bcc079c59b52d70d2c5aee11326c2d9ef1533caa112cfa9fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Albert556/ai-providers/releases/download/v1.1.2/aip-v1.1.2-x86_64-unknown-linux-gnu"
      sha256 "b36119b4ef781da0e032433c95e0e45788ee6eb9511f675025053aed9c5cc335"
    end
  end

  def install
    if OS.mac?
      bin.install "aip-v#{version}-aarch64-apple-darwin" => "aip"
    elsif OS.linux?
      bin.install "aip-v#{version}-x86_64-unknown-linux-gnu" => "aip"
    end

    chmod 0555, bin/"aip"

    generate_completions_from_executable(bin/"aip", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aip --version")
  end
end
