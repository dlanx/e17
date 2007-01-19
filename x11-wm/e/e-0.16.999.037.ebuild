# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/e/e-9999.ebuild,v 1.7 2006/10/22 05:44:35 vapier Exp $

inherit enlightenment

MY_P="enlightenment-${PV}"
SRC_URI="http://enlightenment.freedesktop.org/files/${MY_P}.tar.gz"

DESCRIPTION="the e17 window manager"

IUSE="pam"

RDEPEND="x11-libs/ecore
	media-libs/edje
	dev-libs/eet
	dev-libs/embryo
	x11-libs/evas
	pam? (sys-libs/pam)"

DEPEND="${RDEPEND}
	x11-proto/xproto"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	if ! built_with_use x11-libs/evas png ; then
		eerror "Re-emerge evas with USE=png"
		die "Re-emerge evas with USE=png"
	fi
	enlightenment_pkg_setup
}

src_unpack() {
	enlightenment_src_unpack
	sed -i \
		-e 's:bin/enlightenment:bin/enlightenment-0.17:' \
		"${S}"/src/bin/e_start_main.c || die
}

src_install() {
	enlightenment_src_install
	mv "${D}"/usr/bin/enlightenment{,-0.17}
}

pkg_postinst() {
	ewarn "This version has been installed as"
	ewarn "'enlightenment-0.17' to avoid conflict"
	ewarn "with enlightenment 0.16 versions."
}
