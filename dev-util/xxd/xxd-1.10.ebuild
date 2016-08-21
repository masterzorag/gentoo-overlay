# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

MY_P=xxd-src-${PV}
DESCRIPTION="make a hexdump or do the reverse"
HOMEPAGE="http://ftp.uni-erlangen.de/pub/utilities/etc/?order=s"
SRC_URI="https://github.com/masterzorag/gentoo-overlay/raw/master/dev-util/xxd/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

src_install() {
	exeinto /bin
	newexe xxd xxd || die "Install failed!"
	
	doman xxd.1
}
