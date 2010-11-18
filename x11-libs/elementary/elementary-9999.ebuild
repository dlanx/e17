# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_SUB_PROJECT="TMP/st"
inherit enlightenment

DESCRIPTION="Basic widget set, based on EFL for mobile touch-screen devices."

DEPEND=">=dev-libs/ecore-9999
	>=media-libs/evas-9999
	>=media-libs/edje-9999"
RDEPEND=${DEPEND}
