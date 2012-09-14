# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit enlightenment

DESCRIPTION="Wrapper between Bullet Physics and EFL to add physics effects in a simple way"
IUSE="static-libs test-gui"

RDEPEND="
	>=dev-libs/ecore-9999
	>=dev-libs/eina-9999
	>=media-libs/evas-9999
	>=sci-physics/bullet-2.80
	test-gui? ( >=x11-libs/elementary-9999 )
"
DEPEND="${RDEPEND}"

src_configure() {
	local MY_ECONF="$(use_enable test-gui build-tests)"
	enlightenment_src_configure
}
