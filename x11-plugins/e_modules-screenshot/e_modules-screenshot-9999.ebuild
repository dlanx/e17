# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="This module is a port of the e16 epplet E-Screenshot by Tom Gilbert"

DEPEND="media-libs/edje
	>=x11-wm/enlightenment-0.17.0_alpha:0.17=
	x11-misc/emprint
	|| ( media-gfx/imagemagick media-gfx/scrot )"
RDEPEND=${DEPEND}
