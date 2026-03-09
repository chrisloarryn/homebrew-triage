class Triage < Formula
  desc "OpenIncidents CLI"
  homepage "https://github.com/xperro/OpenIncidents"
  url "https://github.com/xperro/OpenIncidents/releases/download/v1.0.4/triage_1.0.4_bundle.tar.gz"
  sha256 "950703801c43462a99d5b08a2f97d78e3e788fcbad91e1ce449c911c662ccf33"
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
