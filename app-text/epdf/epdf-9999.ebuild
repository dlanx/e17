# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/enscribe/enscribe-9999.ebuild,v 1.1 2005/09/07 03:55:40 vapier Exp $

ESVN_SUB_PROJECT="PROTO"
inherit enlightenment

DESCRIPTION="PDF viewer with widgets for EWL, ETK, and Evas"

DEPEND=">=app-text/poppler-0.5.9
	>=x11-libs/evas-9999
	>=x11-libs/ecore-9999
	>=x11-libs/ewl-9999
	>=x11-libs/etk-9999
	>=media-libs/imlib2-1.4
	>=media-libs/epsilon-0.3"
