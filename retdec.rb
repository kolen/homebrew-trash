class Retdec < Formula
  desc "Retargetable machine-code decompiler based on LLVM"
  homepage "https://retdec.com/"
  # release does not work, use --head
  url "https://github.com/avast-tl/retdec/archive/v3.0.tar.gz"
  sha256 "629f799dd13c52bee94b28128dc46a7dab99e3b735c08c187cd502008941663d"
  head "https://github.com/avast-tl/retdec.git"

  depends_on "cmake" => :build
  depends_on "flex" => :build
  depends_on "perl" => :build

  def install
    ENV.deparallelize
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test retdec`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
