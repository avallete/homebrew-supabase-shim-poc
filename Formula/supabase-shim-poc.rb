class SupabaseShimPoc < Formula
  desc "Supabase CLI"
  homepage "https://supabase.com"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.2/supabase_0.0.2_darwin_arm64.tar.gz"
      sha256 "2f30d6f542fe53fa11af7f01ca441c7ca44308426e2a630f8bddbacb7fbb8a20"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.2/supabase_0.0.2_darwin_amd64.tar.gz"
      sha256 "af7728e322a32698d1d8f49852a9e823eff1225f2bacdbfe03793f591df16c5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.2/supabase_0.0.2_linux_arm64.tar.gz"
      sha256 "d79c20045874f374b6178dd0bc522c9035405769884e9a3119307041fd4aa44b"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.2/supabase_0.0.2_linux_amd64.tar.gz"
      sha256 "f5534d56b0a196b9057aa3a1881e0497624263bbc4484e1fd990518fb0a81930"
    end
  end

  def install
    bin.install "supabase" => "supabase-shim-poc"
    bin.install "supabase-go" if File.exist?("supabase-go")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supabase-shim-poc --version")
  end
end
