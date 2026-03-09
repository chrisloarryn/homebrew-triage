class Triage < Formula
  desc "OpenIncidents CLI"
  homepage "https://github.com/xperro/OpenIncidents"
  url "https://github.com/xperro/OpenIncidents/releases/download/v1.0.6/triage_1.0.6_bundle.tar.gz"
  sha256 "435a252f2187057364afebfce56597103c7bc625fc6bf11b299698f771b8f223"
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
