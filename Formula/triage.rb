class Triage < Formula
  desc "OpenIncidents CLI"
  homepage "https://github.com/xperro/OpenIncidents"
  url "https://github.com/xperro/OpenIncidents/releases/download/v1.0.5/triage_1.0.5_bundle.tar.gz"
  sha256 "204599ca64a738f3d0d698f5b7b1a433fa28c081e069d05447bd833f2f34f8d8"
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
