class SupabaseShimPoc < Formula
  desc "Supabase CLI"
  homepage "https://supabase.com"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.4/supabase_0.0.4_darwin_arm64.tar.gz"
      sha256 "ba4847fca8f89abf734bd1dc0d548172c398448a3ee0785a51c1d98645a2e9f8"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.4/supabase_0.0.4_darwin_amd64.tar.gz"
      sha256 "e74e22d3e49a6b69937b7acee337522037bea4069a1dc1abd2a636c67e809425"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.4/supabase_0.0.4_linux_arm64.tar.gz"
      sha256 "32ced3d9dad13dcfff139378c293343e5f4b12d863cb471a61411e0cf3437db9"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.4/supabase_0.0.4_linux_amd64.tar.gz"
      sha256 "44204261bd6e7aa0a0e6c7b5cb2111113582f2c249cb7443f2c11c13cce7ce60"
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
