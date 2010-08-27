# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit enlightenment

DESCRIPTION="Fast memory pool allocator"
HOMEPAGE="http://code.google.com/p/ememoa/"

SLOT="0"

IUSE="debug static-libs +threads"

ESVN_REPO_URI="http://ememoa.googlecode.com/svn/trunk/"
RDEPEND=""
DEPEND="
	dev-util/pkgconfig
	"

src_configure() {
	MY_ECONF="
	$(use_enable amd64 use64)
	$(use_enable debug)
	$(use_enable debug coverage)
	$(use_enable static-libs static)
	$(use_enable threads pthread)
	"

	enlightenment_src_configure
}
