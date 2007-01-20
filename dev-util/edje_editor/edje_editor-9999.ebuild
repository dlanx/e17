# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/etk/etk-9999.ebuild,v 1.1 2005/11/09 00:03:22 vapier Exp $

ECVS_MODULE="e17/proto/edje_editor"
inherit enlightenment

DESCRIPTION="edje editor based on etk"

DEPEND="x11-libs/ecore
	x11-libs/etk
	media-libs/edje
	dev-libs/engrave
	x11-libs/evas"
