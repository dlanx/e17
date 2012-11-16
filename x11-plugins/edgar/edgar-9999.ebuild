# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

ESVN_SERVER="http://e17mods.googlecode.com/svn/trunk"
ESVN_SUB_PROJECT="MODULES"
inherit enlightenment

DESCRIPTION="E17 Edgar Gadgets Loader"
HOMEPAGE="http://code.google.com/p/e17mods/wiki/Edgar"

LICENSE="GPL-2"

DEPEND="x11-wm/enlightenment
	media-libs/edje"
