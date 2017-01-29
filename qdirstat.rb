class Qdirstat < Formula
  desc "Qt-based directory size statistics"
  homepage "https://github.com/shundhammer/qdirstat"
  url "https://github.com/shundhammer/qdirstat/archive/1.0.tar.gz"
  sha256 "b8404af004606a9d0e7f3a35bb28f6629a8c84620549fcab8898a551cc07b3a4"
  head "https://github.com/shundhammer/qdirstat.git"

  depends_on "qt5"
  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "qmake", "."
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test qdirstat`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
