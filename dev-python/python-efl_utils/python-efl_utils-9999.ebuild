# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
E_PKG_IUSE="examples"
E_PYTHON="yes"
ESVN_SUB_PROJECT="BINDINGS/python"
E_WANT_AUTOTOOLS="no"

inherit efl distutils

DESCRIPTION="Utilities to work with EFL"
HOMEPAGE="http://www.enlightenment.org"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND=">=dev-python/python-efl-9999"

src_configure()
{
	:
}
