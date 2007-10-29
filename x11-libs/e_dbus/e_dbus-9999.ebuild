# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ECVS_MODULE="e17/libs/e_dbus"
inherit enlightenment

DESCRIPTION="enlightenment interface to dbus"

IUSE="X"

# Removed EWL GUI due to lack of updated code in CVS
#	X? ( x11-libs/ewl dev-libs/efreet )
DEPEND=">=x11-libs/ecore-9999
	sys-apps/dbus
	sys-apps/hal"
