# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit enlightenment

DESCRIPTION="Enlightenment thumbnailing library (meant to replace epsilon)"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Ethumb"
LICENSE="LGPL-3"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

IUSE="+dbus emotion epdf static-libs"

DEPEND=">=dev-libs/eina-1.7
	>=dev-libs/ecore-1.7
	>=media-libs/edje-1.7
	>=media-libs/evas-1.7
	media-libs/libexif

	dbus? ( >=dev-libs/e_dbus-1.7 )
	emotion? ( >=media-libs/emotion-1.7 )
	epdf? ( >=app-text/epdf-1.7 )"

RDEPEND="${DEPEND}"

src_configure() {
	MY_ECONF="$(use_enable dbus ethumbd)
		$(use_enable emotion)
		$(use_enable epdf)"

	enlightenment_src_configure
}
