# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_SUB_PROJECT="legacy"
EGIT_URI_APPEND=${PN}
EGIT_BRANCH=${PN}-1.7

inherit enlightenment

DESCRIPTION="library for handling of freedesktop.org specs (desktop/icon/theme/etc...)"
RDEPEND="
	>=dev-libs/ecore-9999
	>=dev-libs/edbus2-9999
	>=dev-libs/eet-9999
	>=dev-libs/eina-9999
	x11-misc/xdg-utils"
DEPEND="${RDEPEND}"

IUSE="static-libs"
