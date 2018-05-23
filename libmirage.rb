class Libmirage < Formula
  desc "CD-ROM/DVD-ROM image access library"
  homepage "http://cdemu.sourceforge.net/about/libmirage/"
  url "https://downloads.sourceforge.net/cdemu/libmirage-3.1.0.tar.bz2"
  sha256 "b67ecc1056cf1986321d637f1a52cb36b0f5bec4fac08fd9c71075dcb7dd7363"
  depends_on "cmake" => :build
  depends_on "glib"
  depends_on "libsndfile"
  depends_on "xz"
  depends_on "gobject-introspection" => :recommended # TODO: does not work

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libmirage`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
