class Tealdeer < Formula
  desc "Very fast implementation of tldr in Rust"
  homepage "https://github.com/dbrgn/tealdeer"
  url "https://github.com/dbrgn/tealdeer/archive/v1.0.0.tar.gz"
  sha256 "9d9712e1b1a17c23793e81691ca6f8e4d45b7fd77efa300261e066c2d254705b"

  bottle do
    sha256 "6527b431ae61c93de802a0d2908f0602fe18dc938aae8e04c550a7c139fae814" => :mojave
    sha256 "6fe1c7f4b93ce556af3e5c75bb5124646ce9ceaec80db82ce75538a98cf29a18" => :high_sierra
    sha256 "505491bf49d382dd39c53a6df1ddce99d1a63d9202e23c9d7156dabb9a069fee" => :sierra
  end

  depends_on "rust" => :build

  conflicts_with "tldr", :because => "both install `tldr` binaries"

  def install
    system "cargo", "install", "--root", prefix,
                               "--path", "."
    bash_completion.install "bash_tealdeer"
  end

  test do
    assert_match "brew", shell_output("#{bin}/tldr -u && #{bin}/tldr brew")
  end
end
