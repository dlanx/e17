# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/epsilon/epsilon-9999.ebuild,v 1.6 2007/01/04 06:08:38 vapier Exp $

inherit enlightenment

DESCRIPTION="nice thumbnail generator"

IUSE="xine"

DEPEND=">=media-libs/imlib2-1.2.0
	>=media-libs/libpng-1.2.0
	>=media-libs/edje-0.5.0
	>=x11-libs/evas-0.9.9
	>=x11-libs/ecore-0.9.9
	>=media-libs/epeg-0.9.0
	dev-lang/perl
	xine? ( >=media-libs/xine-lib-1.1.1 )"

src_compile() {
	export MY_ECONF="
		$(use_enable xine thumbnailer-xine) \
	"

	enlightenment_src_compile
}
