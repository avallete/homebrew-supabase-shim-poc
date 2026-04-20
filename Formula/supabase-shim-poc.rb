class SupabaseShimPoc < Formula
  desc "Supabase CLI"
  homepage "https://supabase.com"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.3/supabase_0.0.3_darwin_arm64.tar.gz"
      sha256 "b687c14585969b1f337a7fd6aa18f2b711b91615f4b230fabe051cb7398377f5"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.3/supabase_0.0.3_darwin_amd64.tar.gz"
      sha256 "0efbb8d900d7c0569340e43359abe60f485fd236095784fd4864bf49161835f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.3/supabase_0.0.3_linux_arm64.tar.gz"
      sha256 "f34e0c598f3701144441ed2adc528138d66e619703694928f2515d3202290a99"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.3/supabase_0.0.3_linux_amd64.tar.gz"
      sha256 "b9346d3b43051dbd9e45dbdcd63b31279a4a71f0b13d0e337e4bbeaef2056def"
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
