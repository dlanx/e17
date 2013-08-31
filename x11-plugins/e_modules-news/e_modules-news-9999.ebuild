# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_SUB_PROJECT="enlightenment/modules"
EGIT_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="Module to display information feeds like RSS"

DEPEND=">=media-libs/edje-0.5.0
	>=x11-wm/enlightenment-0.17.0_alpha:0.17="
RDEPEND=${DEPEND}
