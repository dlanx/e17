# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/e/e-9999.ebuild,v 1.7 2006/10/22 05:44:35 vapier Exp $

E_SNAP_DATE="2008-09-25"
inherit enlightenment

DESCRIPTION="the e17 window manager"

IUSE="pam dbus"

RDEPEND=">=x11-libs/ecore-0.9.9.050
	>=media-libs/edje-0.9.9.050
	>=dev-libs/eet-1.1.0
	>=dev-libs/efreet-0.5.0.050
	>=dev-libs/embryo-0.9.9.050
	>=x11-libs/evas-0.9.9.050
	pam? ( sys-libs/pam )
	dbus? ( >=x11-libs/e_dbus-0.5.0.050 )"
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