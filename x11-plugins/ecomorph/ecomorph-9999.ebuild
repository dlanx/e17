# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

EAPI=2

EGIT_REPO_URI="git://github.com/jeffdameth/ecomorph.git"
EGIT_BOOTSTRAP="enlightenment_src_prepare"

inherit enlightenment git

DESCRIPTION="Ecomorph is a compositing manager for e17"

IUSE="static-libs"

CDEPEND=">=media-libs/edje-0.5.0
	>=x11-wm/enlightenment-9999
	dev-libs/libxml2
	dev-libs/libxslt
	media-libs/mesa
	sys-apps/dbus"
DEPEND="${CDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/libtool"
RDEPEND="${CDEPEND}
	x11-apps/mesa-progs
	x11-apps/xdpyinfo
	x11-wm/ecomp"

pkg_postinst() {
	elog "if you want to start ecomp with the ecomorph module,"
	elog "then you either need xterm installed or a symlink for"
	elog "it in your path, since ecomorph uses the xterm command"
	elog "to start ecomp. You can safely close the appearing window"
	elog "after starting ecomp and it will run in the background"
}
