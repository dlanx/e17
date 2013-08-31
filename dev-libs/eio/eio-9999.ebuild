# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_SUB_PROJECT="legacy"
EGIT_URI_APPEND=${PN}
EGIT_BRANCH=${PN}-1.7

inherit enlightenment

DESCRIPTION="Enlightenment's integration to IO"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/EIO"
LICENSE="BSD"

IUSE="static-libs +threads"

RDEPEND=">=dev-libs/ecore-9999"
DEPEND="${RDEPEND}"

src_configure() {
	MY_ECONF="$(use_enable threads posix-threads)"
	enlightenment_src_configure
}
