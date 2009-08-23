# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.4"
ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment distutils

DESCRIPTION="Python bindings for EVAS library"
HOMEPAGE="http://www.enlightenment.org/"

LICENSE="LGPL-2.1"
IUSE=""

RDEPEND=">=x11-libs/evas-9999
	dev-libs/eina"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9.0
	>=dev-python/cython-0.9.6.12
	dev-python/pyrex
	dev-python/setuptools"

src_unpack() {
	enlightenment_src_unpack
}
