# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_SUB_PROJECT="core"
EGIT_URI_APPEND=${PN}
EGIT_BRANCH=${PN}-1.7

inherit enlightenment

DESCRIPTION="Basic widget set, based on EFL for mobile touch-screen devices."
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Elementary"
LICENSE="LGPL-2.1"

IUSE="dbus fbcon quicklaunch sdl thumbnails weather X xdg static-libs"

DEPEND="
	>=dev-libs/ecore-9999[evas,fbcon?,sdl?,X?]
	>=media-libs/evas-9999[fbcon?,X?]
	>=media-libs/edje-9999
	dbus? ( >=dev-libs/e_dbus-9999 )
	xdg? ( >=dev-libs/efreet-9999 )
	weather? ( >=net-libs/libeweather-9999 )
	thumbnails? ( >=media-libs/ethumb-9999[dbus?] )"
RDEPEND="${DEPEND}"

src_configure() {
	MY_ECONF="$(use_enable dbus edbus)
		$(use_enable fbcon ecore-fb)
		$(use_enable quicklaunch quick-launch)
		$(use_enable sdl ecore-sdl)
		$(use_enable thumbnails ethumb)
		$(use_enable weather eweather)
		$(use_enable X ecore-x)
		$(use_enable xdg efreet)"

	enlightenment_src_configure
}
