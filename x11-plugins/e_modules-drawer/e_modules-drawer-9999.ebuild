# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"
inherit enlightenment

DESCRIPTION="A drawer module to present different types of information"
IUSE="xpixmap"
DEPEND=">=media-libs/edje-0.5.0
	>=media-libs/ethumb-9999[dbus]
	xpixmap? ( >=x11-libs/esmart-9999 )
	>=x11-wm/enlightenment-0.16.999"
RDEPEND=${DEPEND}

src_configure() { :; }

src_compile() {
	MY_ECONF="$(use_enable xpixmap)"
	enlightenment_src_compile
}
