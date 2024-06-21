Name:       pmlc-smart
Version:    0.1.0a1
Release:    1%{?dist}
Summary:    Monitor harddisk health (S.M.A.R.T.)
License:    GPL-3.0-or-later
URL:        https://github.com/fm-elpac/pmlc-smart
Requires:   smartmontools

%description
This tool is powered by smartmontools.

%install
mkdir -p %{buildroot}/usr/bin
install -Dm755 -t %{buildroot}/usr/bin %{_topdir}/SOURCES/bin/pmlc-smart-clean.sh
install -Dm755 -t %{buildroot}/usr/bin %{_topdir}/SOURCES/bin/pmlc-smart-dds.sh
install -Dm755 -t %{buildroot}/usr/bin %{_topdir}/SOURCES/bin/pmlc-smart-fds.sh
install -Dm755 -t %{buildroot}/usr/bin %{_topdir}/SOURCES/bin/pmlc-smart-fp.sh
install -Dm755 -t %{buildroot}/usr/bin %{_topdir}/SOURCES/bin/pmlc-smart-w.sh
mkdir -p %{buildroot}/usr/lib/systemd/system
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-clean.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-dds-f@.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-dds@.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-fds@.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-tl@.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-ts@.service
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-clean.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-dds-f@.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-dds@.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-fds@.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-tl@.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart-ts@.timer
install -Dm644 -t %{buildroot}/usr/lib/systemd/system %{_topdir}/SOURCES/systemd/pmlc-smart@.target

%files
/usr/bin/pmlc-smart-clean.sh
/usr/bin/pmlc-smart-dds.sh
/usr/bin/pmlc-smart-fds.sh
/usr/bin/pmlc-smart-fp.sh
/usr/bin/pmlc-smart-w.sh
/usr/lib/systemd/system/pmlc-smart-clean.service
/usr/lib/systemd/system/pmlc-smart-dds-f@.service
/usr/lib/systemd/system/pmlc-smart-dds@.service
/usr/lib/systemd/system/pmlc-smart-fds@.service
/usr/lib/systemd/system/pmlc-smart-tl@.service
/usr/lib/systemd/system/pmlc-smart-ts@.service
/usr/lib/systemd/system/pmlc-smart-clean.timer
/usr/lib/systemd/system/pmlc-smart-dds-f@.timer
/usr/lib/systemd/system/pmlc-smart-dds@.timer
/usr/lib/systemd/system/pmlc-smart-fds@.timer
/usr/lib/systemd/system/pmlc-smart-tl@.timer
/usr/lib/systemd/system/pmlc-smart-ts@.timer
/usr/lib/systemd/system/pmlc-smart@.target

%changelog
# TODO
