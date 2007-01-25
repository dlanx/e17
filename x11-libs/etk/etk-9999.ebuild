# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/etk/etk-9999.ebuild,v 1.1 2005/11/09 00:03:22 vapier Exp $

inherit enlightenment

DESCRIPTION="toolkit based on the EFL"

IUSE="nls X fbcon"

DEPEND=">=x11-libs/evas-0.9.9
	>=media-libs/edje-0.5.0
	>=x11-libs/ecore-0.9.9"

pkg_setup() {
	if ! built_with_use x11-libs/evas png ; then
		eerror "Re-emerge evas with USE=png"
		die "Re-emerge evas with USE=png"
	fi

	if use X ; then
		if ! built_with_use x11-libs/ecore X ; then
			eerror "Re-emerge ecore with USE=X"
			die "Re-emerge ecore with USE=X"
		fi
	fi

	if use fbcon ; then
		if ! built_with_use x11-libs/ecore fbcon ; then
			eerror "Re-emerge ecore with USE=fbcon"
			die "Re-emerge ecore with USE=fbcon"
		fi
	fi

	enlightenment_pkg_setup
}

src_compile() {
	export MY_ECONF="
		$(use_enable nls)
	"
	enlightenment_src_compile
}

src_install() {

	enlightenment_src_install

	if use doc ; then
		dohtml doc/html/*
	fi
}
