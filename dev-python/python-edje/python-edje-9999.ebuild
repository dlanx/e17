# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.4"
ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment distutils

DESCRIPTION="Python bindings for edje"
LICENSE="LGPL-2.1"
IUSE=""

RDEPEND=">=media-libs/edje-9999
	>=dev-python/python-evas-9999"
DEPEND="${RDEPEND}
	>=dev-python/cython-0.9.8
	>=dev-python/setuptools-0.6_rc9"

src_unpack() {
	enlightenment_src_unpack
}
