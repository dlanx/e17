# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="Gadget to display the current uptime of the system"

DEPEND=">=x11-wm/enlightenment-0.17.0_alpha:0.17=
	dev-libs/eet
	>=media-libs/edje-0.5.0"
RDEPEND=${DEPEND}
