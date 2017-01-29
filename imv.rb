class Imv < Formula
  desc "Simple SDL-based image viewer"
  homepage "https://github.com/exec64/imv"
  url "https://github.com/eXeC64/imv/archive/v2.1.3.tar.gz"
  sha256 "f0b9acd7cff1d2f7301cb5cffb261ace4d0af2003dc4a293d9a37e73074978b7"

  depends_on "fontconfig"
  depends_on "sdl2"
  depends_on "sdl2_ttf"
  depends_on "freeimage"

  def install
    ENV.deparallelize
    system "make", "CFLAGS='-Dst_mtim=st_mtime'"
    system "make install"
  end

  test do
    system "false"
  end
end
