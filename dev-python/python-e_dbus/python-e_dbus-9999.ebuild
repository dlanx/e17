# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.4"
ESVN_SUB_PROJECT="BINDINGS/python"

inherit enlightenment distutils

DESCRIPTION="Python bindings for E_DBUS library"
LICENSE="LGPL-2.1"
IUSE=""

RDEPEND=">=x11-libs/e_dbus-9999"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	>=dev-python/setuptools-0.6_rc9"

src_unpack() {
	enlightenment_src_unpack
}
