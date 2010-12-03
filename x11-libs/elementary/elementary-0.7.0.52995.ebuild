# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

E_SNAP_DATE="2010-10-03"
inherit enlightenment

DESCRIPTION="Basic widget set, based on EFL for mobile touch-screen devices."

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-libs/edje-1.0.0_beta
	>=dev-libs/ecore-1.0.0_beta
	>=media-libs/evas-1.0.0_beta"
RDEPEND=${DEPEND}
