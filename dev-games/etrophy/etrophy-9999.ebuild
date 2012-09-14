# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

ESVN_SUB_PROJECT="PROTO"

inherit enlightenment

DESCRIPTION="Library for games to manage scores, trohpies and unlockables"
IUSE="static-libs"

RDEPEND=">=dev-libs/ecore-9999
	>=dev-libs/eet-9999
	>=dev-libs/eina-9999
	>=media-libs/evas-9999
	>=x11-libs/elementary-9999"
DEPEND="${RDEPEND}"
