class Pointfix < Formula
  desc "Point at a UI problem and Pointfix has your local coding agent fix it"
  homepage "https://pointfix.dev"
  url "https://download.pointfix.dev/cli/pointfix-0.2.2.tgz"
  sha256 "1fa90082778ea6b23012dc00a26c5fc1f456c28cc3c2a4e610c51fb0b218ba80"
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
