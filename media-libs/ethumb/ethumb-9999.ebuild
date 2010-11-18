# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit enlightenment

DESCRIPTION="Enlightenment thumbnailing library (meant to replace epsilon)"

LICENSE="LGPL-3"

IUSE="dbus emotion epdf"

DEPEND=">=dev-libs/eina-9999
	>=media-libs/edje-9999
	>=dev-libs/ecore-9999
	>=dev-libs/evas-9999

	dbus? ( >=dev-libs/e_dbus-9999 )
	emotion? ( >=media-libs/emotion-9999 )
	epdf? ( >=app-text/epdf-9999 )"

RDEPEND="${DEPEND}"

src_compile() {
	MY_ECONF="$(use_enable dbus ethumbd)
		$(use_enable emotion)
		$(use_enable epdf)"

	enlightenment_src_compile
}
