# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit enlightenment

DESCRIPTION="Provides external applications as generic loaders for Evas"
HOMEPAGE="http://www.enlightenment.org/"

IUSE="gstreamer pdf ps raw svg"

RDEPEND="
	>=media-libs/evas-9999
	gstreamer? ( media-libs/gstreamer )
	pdf? ( app-text/poppler )
	ps? ( app-text/libspectre )
	raw? ( media-libs/libraw )
	svg? ( gnome-base/librsvg )"
DEPEND="${RDEPEND}"

src_configure() {
	use gstreamer || MY_ECONF="--disable-gstreamer"
	use pdf || MY_ECONF="--disable-poppler"
	use ps || MY_ECONF="--disable-spectre"
	use raw || MY_ECONF="--disable-libraw"
	use svg || MY_ECONF="--disable-svg"

	enlightenment_src_configure
}
