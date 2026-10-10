class Pointfix < Formula
  desc "Point at a UI problem and Pointfix has your local coding agent fix it"
  homepage "https://pointfix.dev"
  url "https://download.pointfix.dev/cli/pointfix-0.2.4.tgz"
  sha256 "184649463ac584a1eb60eaa3ddff40e4a954fa2b855d37098bffcc0f09792743"
  license :cannot_represent # proprietary, free to use

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pointfix --version")
    (testpath/"package.json").write "{\"scripts\":{\"dev\":\"vite\"}}"
    system bin/"pointfix", "init", "--yes", "--agent=codex", "--port=4899"
    assert_path_exists testpath/"pointfix.config.json"
  end
end
