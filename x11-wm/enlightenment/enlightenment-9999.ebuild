# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

ESVN_URI_APPEND="e"
inherit enlightenment

DESCRIPTION="the e17 window manager"

SLOT="0.17"
IUSE="exchange pam"

RDEPEND="exchange? ( >=app-misc/exchange-9999 )
	>=dev-libs/eet-9999
	>=dev-libs/efreet-9999
	>=dev-libs/eina-9999
	>=dev-libs/embryo-9999
	>=media-libs/edje-9999
	pam? ( sys-libs/pam )
	>=x11-libs/ecore-9999
	>=x11-libs/evas-9999[fontconfig,png]
	>=x11-libs/e_dbus-9999"

# Masked modules due to theirs merge into 'e' tree, forcing against them, to
# prevent any collisions
DEPEND="${RDEPEND}
	!x11-plugins/e_modules-systray
	x11-proto/xproto
	sys-devel/libtool"

src_configure() {
	export MY_ECONF="
		$(use_enable exchange)
	"
	enlightenment_src_configure
}
