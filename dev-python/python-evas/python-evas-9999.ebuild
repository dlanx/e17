# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

NEED_PYTHON="2.4"
ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment python distutils

DESCRIPTION="Python bindings for evas"

IUSE="examples"

RDEPEND=">=dev-python/cython-0.9.8
	dev-python/pyrex
	>=x11-libs/evas-9999"

DEPEND=">=dev-python/setuptools-0.6_rc9
	${RDEPEND}"

src_unpack() {
	enlightenment_src_unpack
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
