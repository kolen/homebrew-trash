# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

# TODO: does not work with default python, however
# python3 /usr/local/bin/image-analyzer works

class ImageAnalyzer < Formula
  desc "Displays tree structure of CD/DVD disc images"
  homepage "http://cdemu.sourceforge.net/about/analyzer/"
  url "http://downloads.sourceforge.net/cdemu/image-analyzer-3.1.0.tar.bz2"
  sha256 "229fdb4708f65a285197c99902faa4acafe10cda6dba23e040b70fd4fb1c22df"
  depends_on "cmake" => :build
  depends_on "gtk+3"
  depends_on "pygobject"
  depends_on "libmirage"
  depends_on "intltool" => :build
  depends_on "gettext"
  # TODO: optional matplotlib + gnuplot

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

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
    # software. Run the test with `brew test image-analyzer`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
