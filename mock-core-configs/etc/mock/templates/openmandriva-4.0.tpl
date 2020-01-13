config_opts['root'] = 'openmandriva-4.0-x86_64'
config_opts['target_arch'] = 'x86_64'
config_opts['legal_host_arches'] = ('x86_64',)
config_opts['chroot_setup_cmd'] = 'install basesystem-minimal rpm-build rpm-openmandriva-setup rpm-openmandriva-setup-build'
config_opts['dist'] = 'omv4000'  # only useful for --resultdir variable subst
config_opts['extra_chroot_dirs'] = [ '/run/lock', ]
config_opts['useradd'] = '/usr/sbin/useradd -o -m -u %(uid)s -g %(gid)s -d %(home)s %(user)s'
config_opts['releasever'] = '4.0'
config_opts['macros']['%cross_compiling'] = '0' # Mock should generally be considered native builds
config_opts['package_manager'] = 'dnf'

config_opts['yum.conf'] = """
[main]
keepcache=1
debuglevel=2
reposdir=/dev/null
logfile=/var/log/yum.log
retries=20
obsoletes=1
gpgcheck=0
assumeyes=1
syslog_ident=mock
syslog_device=
install_weak_deps=0
metadata_expire=0
best=1
protected_packages=

# repos

[openmandriva]
name=OpenMandriva $releasever - x86_64
# Master repository:
# baseurl=http://abf-downloads.openmandriva.org/$releasever/repository/x86_64/main/release/
mirrorlist=http://mirrors.openmandriva.org/mirrors.php?platform=$releasever&arch=x86_64&repo=main&release=release
fastestmirror=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/openmandriva/RPM-GPG-KEY-OpenMandriva
enabled=1
skip_if_unavailable=False

[openmandriva-updates]
name=OpenMandriva $releasever - x86_64 - Updates
# Master repository:
# baseurl=http://abf-downloads.openmandriva.org/$releasever/repository/x86_64/main/updates/
mirrorlist=http://mirrors.openmandriva.org/mirrors.php?platform=$releasever&arch=x86_64&repo=main&release=updates
fastestmirror=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/openmandriva/RPM-GPG-KEY-OpenMandriva
enabled=1
skip_if_unavailable=False

[openmandriva-debuginfo]
name=OpenMandriva $releasever - x86_64 - Debug
# Master repository:
# baseurl=http://abf-downloads.openmandriva.org/$releasever/repository/x86_64/debug_main/release/
mirrorlist=http://mirrors.openmandriva.org/mirrors.php?platform=$releasever&arch=x86_64&repo=debug_main&release=release
fastestmirror=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/openmandriva/RPM-GPG-KEY-OpenMandriva
enabled=0
skip_if_unavailable=False

[openmandriva-updates-debuginfo]
name=OpenMandriva $releasever - x86_64 - Updates - Debug
# Master repository:
# baseurl=http://abf-downloads.openmandriva.org/$releasever/repository/x86_64/debug_main/updates/
mirrorlist=http://mirrors.openmandriva.org/mirrors.php?platform=$releasever&arch=x86_64&repo=debug_main&release=updates
fastestmirror=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/openmandriva/RPM-GPG-KEY-OpenMandriva
enabled=0
skip_if_unavailable=False
"""