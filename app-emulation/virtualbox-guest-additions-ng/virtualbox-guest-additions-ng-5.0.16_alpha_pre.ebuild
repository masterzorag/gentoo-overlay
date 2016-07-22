# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

MY_PN=VBoxGuestAdditions

MY_PV="${PV/_alpha_pre/}"
MY_P=${MY_PN}_${MY_PV}

DESCRIPTION="Next-gen Additionsinstaller for VirtualBox gentoo guests"
HOMEPAGE="http://www.virtualbox.org/"
SRC_URI="http://download.virtualbox.org/virtualbox/${MY_PV}/${MY_P}.iso"

LICENSE="GPL-2+ LGPL-2.1+ MIT SGI-B-2.0 CDDL"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="
	 !!app-emulation/virtualbox
	 !=app-emulation/virtualbox-9999
		!app-emulation/virtualbox-bin
		!app-emulation/virtualbox-extpack-oracle
		!app-emulation/virtualbox-guest-additions
		!app-emulation/virtualbox-modules
		!x11-drivers/xf86-video-virtualbox"

DEPEND="
	sys-apps/dbus[X(+)]
	x11-libs/libXrandr"
			
S="${WORKDIR}"

pkg_setup()
{
    return
}

src_unpack() {
    return
}

src_prepare() {
    return
}

src_install() {
		insinto /tmp/${PN/-additions}
		newins "${DISTDIR}"/${MY_P}.iso ${MY_PN}.iso

		exeinto /tmp/${PN/-additions}
		newexe "${FILESDIR}/autorun.sh" run.sh || die "Install failed!"
}

pkg_preinst()
{
    return
}

pkg_postinst()
{
		# run the script
		/tmp/${PN/-additions}/run.sh || die "Autorun of script failed!"

		# clean up temp files
		[[ -d "/tmp/${PN/-additions}" ]] && rm -rf "/tmp/${PN/-additions}"

		return
}

pkg_prerm() {
    return
}

