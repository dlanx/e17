# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

ESVN_URI_APPEND="${PN/2/}"

inherit enlightenment

DESCRIPTION="Enlightenment's (Ecore) new integration to DBus"

IUSE="static-libs"

RDEPEND=">=dev-libs/eina-9999
	>=dev-libs/ecore-9999
	sys-apps/dbus"
DEPEND="${RDEPEND}"

src_configure() {
	MY_ECONF="$(use_enable doc)"
	enlightenment_src_configure
}
