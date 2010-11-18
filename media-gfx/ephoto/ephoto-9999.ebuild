# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/ephoto/ephoto-9999.ebuild,v 1.1 2006/02/24 02:42:58 vapier Exp $

inherit enlightenment

DESCRIPTION="EFL-based slideshow creator"

DEPEND="dev-libs/evas
	dev-libs/ecore
	x11-libs/ewl
	media-libs/edje
	media-libs/epsilon
	media-libs/libexif
	>=dev-db/sqlite-3"
