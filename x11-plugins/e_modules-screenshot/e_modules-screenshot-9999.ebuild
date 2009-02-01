# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

EVCS_MODULE="E-MODULES-EXTRA/${PN#e_modules-}"
inherit enlightenment

DESCRIPTION="This module is a port of the e16 epplet E-Screenshot by Tom Gilbert"

IUSE=""

DEPEND="media-libs/edje
	x11-wm/e
	x11-misc/emprint
	|| ( media-gfx/imagemagick media-gfx/scrot )"
