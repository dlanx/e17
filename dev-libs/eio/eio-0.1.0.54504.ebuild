# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
E_SNAP_DATE="2010-11-12"

inherit enlightenment

DESCRIPTION="Enlightenment's integration to IO"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/EIO"
LICENSE="BSD"

KEYWORDS="~amd64 ~x86"
IUSE="static-libs +threads"

RDEPEND=">=dev-libs/ecore-1.0.0_beta2"
DEPEND="${RDEPEND}"

src_configure() {
	MY_ECONF="$(use_enable threads posix-threads)"
	enlightenment_src_configure
}
