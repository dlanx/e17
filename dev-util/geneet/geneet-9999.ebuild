# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

WANT_AUTOTOOLS="no"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
SUPPORT_PYTHON_ABIS="1"

inherit enlightenment distutils

DESCRIPTION="C boilerplate generator for EET datastructures"
HOMEPAGE="http://git.profusion.mobi/~leandro/geneet.html"

KEYWORDS=""
IUSE=""

DEPEND="virtual/pyparsing"
RDEPEND="${DEPEND}"

src_configure() {
	:
}
