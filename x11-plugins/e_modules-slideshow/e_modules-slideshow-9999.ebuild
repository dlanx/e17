# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

EAPI=1

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"
inherit enlightenment

DESCRIPTION="This module is a port of the e16 epplet E-Slides by Michael Jennings"

DEPEND=">=x11-wm/enlightenment-0.17.0_alpha:0.17
	>=media-libs/edje-0.5.0"
