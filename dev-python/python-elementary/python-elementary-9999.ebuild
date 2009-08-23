# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.4"
ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment distutils

DESCRIPTION="Python bindings for elementary library"
HOMEPAGE="http://www.enlightenment.org/"
LICENSE="|| ( GPL-3 LGPL-3 )"
IUSE=""

RDEPEND=">=dev-libs/eina-9999
	x11-libs/elementary"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0
	dev-python/cython
	dev-python/pyrex"

src_unpack() {
	enlightenment_src_unpack
}
