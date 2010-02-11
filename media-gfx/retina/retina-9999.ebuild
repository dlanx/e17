# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

ESVN_BRANCH="/"
ESVN_SUB_PROJECT="OLD/MISC"
inherit enlightenment

DESCRIPTION="Evas powered image viewer"

IUSE=""

DEPEND="x11-libs/ecore
	x11-libs/evas
	media-libs/imlib2"

RDEPEND="${DEPEND}"
