# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_MODULE="e17/proto/e_dbus"
inherit enlightenment

DESCRIPTION="enlightenment interface to dbus"
SRC_URI="http://download.enlightenment.org/snapshots/2007-08-26/${P}.tar.gz"

IUSE="X"

# Removed EWL GUI due to lack of updated code in CVS
#	X? ( x11-libs/ewl dev-libs/efreet )
DEPEND=">=x11-libs/ecore-0.9.9.041
	sys-apps/dbus
	sys-apps/hal"
