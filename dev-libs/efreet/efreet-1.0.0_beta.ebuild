# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${P/_beta/.beta}

inherit enlightenment

DESCRIPTION="library for handling of freedesktop.org specs (desktop/icon/theme/etc...)"
SRC_URI="http://download.enlightenment.org/releases/${MY_P}.tar.bz2"

KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND=">=x11-libs/ecore-1.0.0_beta
	>=dev-libs/eina-1.0.0_beta
	x11-misc/xdg-utils"
DEPEND="${RDEPEND}"
S=${WORKDIR}/${MY_P}
