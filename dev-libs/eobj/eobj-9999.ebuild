# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

ESVN_SUB_PROJECT="PROTO"
inherit enlightenment

DESCRIPTION="E object library"
HOMEPAGE="http://www.enlightenment.org"
SRC_URI=""

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="doc static-libs"

DEPEND=">=dev-libs/eina-9999"
RDEPEND="${DEPEND}"

src_configure() {
	MY_ECONF="$(use_enable doc)"
	enlightenment_src_configure
}
