# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

E_PKG_IUSE="nls"

inherit efl eutils

DESCRIPTION="Elementary based PolicyKit authentication agent"

IUSE=""

DEPEND=">=dev-libs/eina-9999
	>=media-libs/evas-9999
	>=dev-libs/ecore-9999[X]
	>=media-libs/edje-9999
	>=dev-libs/efreet-9999
	>=dev-libs/e_dbus-9999
	>=media-libs/elementary-9999"

RDEPEND="${DEPEND}"
