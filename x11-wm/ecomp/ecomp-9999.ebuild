# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_REPO_URI="git://github.com/jeffdameth/ecomp.git"

inherit autotools enlightenment flag-o-matic git

DESCRIPTION="e17 window manager with compiz"

SLOT="0"
IUSE="+inotify jpeg static-libs"

DEPEND="x11-proto/xproto
	sys-devel/libtool"
RDEPEND="!x11-wm/compiz"

src_prepare() {
	append-ldflags $(no-as-needed)
	eautoreconf
}

src_configure() {
	MY_ECONF="$(use_enable nls)
		$(use_enable inotify)
		$(use_enable jpeg)"
	enlightenment_src_configure
}
