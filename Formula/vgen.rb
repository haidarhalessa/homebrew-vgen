class Vgen < Formula
  desc "A CLI tool to generate Vapor boilerplate components"
  homepage "https://github.com/haidarhalessa/vapor-generator"
  url "https://github.com/haidarhalessa/vapor-generator/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "eb2117978db071293b2fba5cbec2963faac030389b1af0759cdb01532835c7ee"
  license "MIT"
  
  # Swift requires Xcode (or Swift toolchain) to build
  depends_on xcode: ["13.0", :build]

  def install
    # 1. Build the project using Swift Package Manager
    system "swift", "build", "--disable-sandbox", "-c", "release"
    
    # 2. Move the binary to the Homebrew bin location
    bin.install ".build/release/vgen"
  end

  test do
    # Verify it works
    system "#{bin}/vgen", "--help"
  end
end