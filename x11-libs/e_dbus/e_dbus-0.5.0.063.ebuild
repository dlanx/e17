# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

E_SNAP_DATE="2009-12-02"
inherit enlightenment

DESCRIPTION="enlightenment interface to dbus"

DEPEND=">=dev-libs/eina-0.9.9.063
	>=x11-libs/ecore-0.9.9.063
	sys-apps/dbus
	sys-apps/hal"
