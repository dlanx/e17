# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"
inherit enlightenment

DESCRIPTION="EFLized Composite Manager for E17"

DEPEND=">=x11-wm/enlightenment-9999
	>=media-libs/edje-0.5.0
	x11-libs/ecore
	x11-libs/evas
	x11-libs/esmart
	dev-libs/eet
	x11-libs/libXcomposite"
