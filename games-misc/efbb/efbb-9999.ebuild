# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

ESVN_SUB_PROJECT="GAMES"

inherit enlightenment

DESCRIPTION="Escape From Booty Bay"

KEYWORDS=""
IUSE=""

DEPEND="
	>=media-libs/evas-9999
	>=dev-libs/ecore-9999
	>=media-libs/edje-9999
	>=x11-libs/elementary-9999
	>=dev-libs/ephysics-9999
	>=dev-games/etrophy-9999
	>=dev-util/geneet-9999
	media-libs/libcanberra
"
RDEPEND="${DEPEND}"
