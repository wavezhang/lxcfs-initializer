Summary: Linux Containers File System
Name: lxcfs
Version: 3.1.0.cfs
Release: 0%{?dist}
URL:  https://github.com/Zexi/lxcfs/archive/cpu-view.zip
License: Apache 2
Source0:  https://github.com/Zexi/lxcfs/archive/cpu-view.zip
Group: System Environment/Libraries

BuildRequires:  kernel-headers
BuildRequires:  libtool
BuildRequires:  systemd
BuildRequires:  fuse-devel
#Requires(post):	  systemd
#Requires(preun):  systemd
#Requires(postun): systemd
Requires: fuse

%description
FUSE filesystem for Linux Containers

%prep
#%setup -q -n lxcfs-lxcfs-3.0.2
%setup -q -n lxcfs-cpu-view

%build
./bootstrap.sh
%configure --with-init-script=systemd
make %{?_smp_mflags}

%install
%make_install SYSTEMD_UNIT_DIR=%{_unitdir}
mkdir -p %{buildroot}/var/lib/lxcfs

%post
%systemd_post %{name}.service

%preun
%systemd_preun %{name}.service

%postun
%systemd_postun %{name}.service

%files

%license COPYING
%{_bindir}/lxcfs
%dir %{_libdir}/%{name}
%{_libdir}/%{name}/lib%{name}.so
%exclude %{_libdir}/%{name}/lib%{name}.la
%dir %{_datadir}/%{name}
%{_unitdir}/%{name}.service
%{_datadir}/%{name}/lxc.mount.hook
%{_datadir}/%{name}/lxc.reboot.hook
%{_datadir}/lxc/config/common.conf.d/00-lxcfs.conf
%dir %{_sharedstatedir}/%{name}

%clean
