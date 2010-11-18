# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

E_CYTHON=1
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment

DESCRIPTION="Python bindings for ecore"
LICENSE="LGPL-2.1"
IUSE="evas static-libs X"

RDEPEND=">=dev-libs/ecore-9999[evas?,X?]"
DEPEND="${RDEPEND}
	evas? ( >=dev-python/python-evas-9999 )
	dev-util/pkgconfig"

src_prepare() {
	enlightenment_src_prepare
	python_copy_sources
}

src_configure() {
	MY_ECONF="$(use_enable evas ecore-evas)
		$(use_enable X ecore-x)
		--disable-ecore-imf
		--disable-ecore-win32"
	python_execute_function -s enlightenment_src_configure
}

src_compile() {
	python_execute_function -s enlightenment_src_compile
}

src_install() {
	python_execute_function -s enlightenment_src_install
}
