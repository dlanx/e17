# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
E_SNAP_DATE="2010-12-03"

inherit enlightenment

DESCRIPTION="Basic widget set, based on EFL for mobile touch-screen devices."
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Elementary"
LICENSE="LGPL-2.1"

KEYWORDS="~amd64 ~x86"
IUSE="dbus fbcon sdl thumbnails weather static-libs X xdg"

DEPEND="
	>=dev-libs/ecore-1.0.0_beta[evas,fbcon?,sdl?,X?]
	>=media-libs/evas-1.0.0_beta[fbcon?,sdl?,X?]
	>=media-libs/edje-1.0.0_beta
	dbus? ( >=dev-libs/e_dbus-1.0.0_beta )
	xdg? ( >=dev-libs/efreet-1.0.0_beta )"
RDEPEND="${DEPEND}"

src_configure() {
	MY_ECONF="$(use_enable dbus edbus)
		$(use_enable fbcon ecore-fb)
		$(use_enable sdl ecore-sdl)
		--disable-ethumb
		--disable-eweather
		$(use_enable X ecore-x)
		$(use_enable xdg efreet)"

	enlightenment_src_configure
}
