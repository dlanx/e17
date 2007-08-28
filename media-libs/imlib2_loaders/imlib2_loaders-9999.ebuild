# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/imlib2_loaders/imlib2_loaders-9999.ebuild,v 1.3 2005/04/10 03:43:09 vapier Exp $

inherit enlightenment

DESCRIPTION="image loader plugins for Imlib 2"
HOMEPAGE="http://www.enlightenment.org/pages/imlib2.html"

IUSE="edb"

RDEPEND=">=media-libs/imlib2-1.2.0
	>=dev-libs/eet-0.9.9
	edb? ( >=dev-db/edb-1.0.5.008 )"

src_compile() {
	export MY_ECONF="
		--enable-eet \
		$(use_enable edb) \
	"
	enlightenment_src_compile
}
