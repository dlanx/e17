# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_SUB_PROJECT="enlightenment/modules"
EGIT_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="Moon Clock module for e17"

DEPEND=">=dev-libs/eet-0.9.10
	>=media-libs/evas-0.9.9
	>=dev-libs/ecore-0.9.9
	>=dev-libs/embryo-0.5.0
	>=media-libs/edje-0.5.0
	>=x11-wm/enlightenment-0.17.0_alpha:0.17="
RDEPEND=${DEPEND}
