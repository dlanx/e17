# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/ewl/ewl-9999.ebuild,v 1.12 2006/10/29 03:22:49 vapier Exp $

inherit enlightenment

DESCRIPTION="simple-to-use general purpose widget library"

IUSE="X fbcon opengl"

RDEPEND=">=media-libs/edje-0.5.0
	>=x11-libs/evas-0.9.9
	>=x11-libs/ecore-0.9.9
	>=media-libs/epsilon-0.3.0
	>=media-libs/emotion-0.0.1"
DEPEND="${RDEPEND}
	doc? ( virtual/tetex )"

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

	if use opengl ; then
		if ! built_with_use x11-libs/ecore opengl ; then
			eerror "Re-emerge ecore with USE=opengl"
			die "Re-emerge ecore with USE=opengl"
		fi
	fi

	enlightenment_pkg_setup
}

src_compile() {
	export MY_ECONF="
		$(use_enable X software-x11)
		$(use_enable opengl opengl-x11)
		$(use_enable fbcon)
	"
	enlightenment_src_compile
}
