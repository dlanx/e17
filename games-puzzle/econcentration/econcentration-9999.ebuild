# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EFL_USE_GIT="yes"
EFL_GIT_REPO_CATEGORY="games"
inherit efl

#E_PKG_IUSE="doc nls"

DESCRIPTION="Contentration game to improve you concentration and memory skills"

LICENSE="LGPL-3 GPL-2 FDL-1.2"
IUSE=""

DEPEND="
	>=dev-libs/efl-9999
	>=dev-games/etrophy-9999
	>=media-libs/elementary-9999
"

RDEPEND="${DEPEND}"