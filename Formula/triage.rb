class Triage < Formula
  desc "OpenIncidents CLI"
  homepage "https://github.com/xperro/OpenIncidents"
  url "https://github.com/xperro/OpenIncidents/releases/download/v1.0.8/triage_1.0.8_bundle.tar.gz"
  sha256 "82f0291fd0651212cae5f7768204a4e93122d8867d5786341c30439c095f0afd"
  depends_on "python"

  def install
    libexec.install "triage.pyz"
    (bin/"triage").write <<~SH
      #!/bin/sh
      exec "#{Formula["python"].opt_bin}/python3" "#{libexec}/triage.pyz" "$@"
    SH
  end

  test do
    assert_match "usage: triage", shell_output("#{bin}/triage --help")
  end
end
