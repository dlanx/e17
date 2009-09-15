# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/esmart/esmart-9999.ebuild,v 1.8 2006/09/24 12:22:05 vapier Exp $

inherit enlightenment

DESCRIPTION="A collection of evas smart objects"

RDEPEND=">=dev-libs/eina-9999
	>=x11-libs/evas-9999
	>=x11-libs/ecore-9999
	>=media-libs/edje-9999
	>=media-libs/imlib2-9999"
DEPEND="${RDEPEND}
	sys-devel/libtool"
