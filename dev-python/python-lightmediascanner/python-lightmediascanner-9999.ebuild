# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

E_PKG_IUSE="doc nls"

PYTHON_DEPEND="*:2.4"
EGIT_REPO_URI="git://git.profusion.mobi/python-lightmediascanner.git"
inherit git-2 python distutils

DESCRIPTION="LightMediaScanner python bindings"
HOMEPAGE="http://lms.garage.maemo.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="examples"

RDEPEND=">=media-libs/lightmediascanner-0.3
	>=dev-python/cython-0.9.8"

DEPEND=">=dev-python/setuptools-0.6_rc9
	${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
