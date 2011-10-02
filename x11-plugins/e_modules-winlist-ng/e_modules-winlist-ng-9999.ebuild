# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="Different window list for e17"

IUSE="static-libs"

DEPEND=">=x11-wm/enlightenment-9999
	media-libs/edje
	dev-libs/efreet"
RDEPEND=${DEPEND}
