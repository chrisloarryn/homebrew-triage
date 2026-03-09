class Triage < Formula
  desc "OpenIncidents CLI"
  homepage "https://github.com/xperro/OpenIncidents"
  url "https://github.com/xperro/OpenIncidents/releases/download/v1.0.7/triage_1.0.7_bundle.tar.gz"
  sha256 "d541907ff2e950585bdbeb20fe522469c1727f43622d791794e393867d6b6d86"
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
