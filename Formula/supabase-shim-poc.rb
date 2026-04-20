class SupabaseShimPoc < Formula
  desc "Supabase CLI"
  homepage "https://supabase.com"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.1/supabase_0.0.1_darwin_arm64.tar.gz"
      sha256 "5e4cad78210c1670335d92e500cf208a5e7c171221b5abe8449f8f76547e02d1"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.1/supabase_0.0.1_darwin_amd64.tar.gz"
      sha256 "ef8616d5b89f70327a942bfd9d281c78624c9aa52e79305e0e62681f3dffe14a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.1/supabase_0.0.1_linux_arm64.tar.gz"
      sha256 "dec0ed0ada94f8c32ff982455e411c7da72822de4e458ef5e9340a247345aa98"
    else
      url "https://github.com/avallete/supabase-cli-release-poc/releases/download/v0.0.1/supabase_0.0.1_linux_amd64.tar.gz"
      sha256 "22d97d46170f04222e73ce05288e036bef773875c78adebd02c6d2d40b8001b3"
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
