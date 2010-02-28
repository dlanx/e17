# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

E_SNAP_DATE="2009-12-02"
inherit enlightenment

DESCRIPTION="the e17 window manager"

SLOT="0.17"
IUSE="pam"

RDEPEND=">=dev-libs/eet-1.2.3
	>=dev-libs/efreet-0.5.0.063
	>=dev-libs/eina-0.9.9.063
	>=dev-libs/embryo-0.9.9.063
	>=media-libs/edje-0.9.9.063
	pam? ( sys-libs/pam )
	>=x11-libs/ecore-0.9.9.063
	>=x11-libs/evas-0.9.9.063
	>=x11-libs/e_dbus-0.5.0.063"
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