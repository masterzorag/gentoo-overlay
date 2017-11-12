# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

MY_P=xxd-src-${PV}
DESCRIPTION="make a hexdump or do the reverse"
HOMEPAGE="http://ftp.uni-erlangen.de/pub/utilities/etc/?order=s"
SRC_URI="https://github.com/masterzorag/gentoo-overlay/raw/master/dev-util/xxd/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
  !app-editors/vim
  !app-editors/vim-core"

src_install() {
	exeinto /usr/bin
	newexe xxd xxd

	doman xxd.1
}
