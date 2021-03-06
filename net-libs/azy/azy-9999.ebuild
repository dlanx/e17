# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
ESVN_SUB_PROJECT="PROTO"

inherit efl

DESCRIPTION="EFL http client/server library"
LICENSE="LGPL-2"

IUSE="static-libs"

RDEPEND="|| (	>=dev-libs/ecore-9999[gnutls]
		>=dev-libs/ecore-9999[ssl] )"

DEPEND="${RDEPEND}"
