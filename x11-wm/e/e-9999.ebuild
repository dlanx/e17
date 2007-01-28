# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/e/e-9999.ebuild,v 1.7 2006/10/22 05:44:35 vapier Exp $

ECVS_MODULE="e17/apps/e"
inherit enlightenment

DESCRIPTION="the e17 window manager"

IUSE="pam"

RDEPEND="x11-libs/ecore
	media-libs/edje
	dev-libs/eet
	dev-libs/embryo
	x11-libs/evas
	sys-apps/pmount
	pam? ( sys-libs/pam )"
DEPEND="${RDEPEND}
	x11-proto/xproto
	sys-devel/libtool"

pkg_setup() {
	if ! built_with_use x11-libs/evas png ; then
		eerror "Re-emerge evas with USE=png"
		die "Re-emerge evas with USE=png"
	fi
	enlightenment_pkg_setup
}
