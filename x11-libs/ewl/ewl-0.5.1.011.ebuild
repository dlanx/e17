# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/ewl/ewl-9999.ebuild,v 1.12 2006/10/29 03:22:49 vapier Exp $

inherit enlightenment

SRC_URI="http://download.enlightenment.org/snapshots/2007-08-26/${P}.tar.gz"

DESCRIPTION="simple-to-use general purpose widget library"

IUSE="X fbcon opengl"

RDEPEND=">=media-libs/edje-0.5.0.041
	>=media-libs/evas-0.9.9.041
	>=dev-libs/ecore-0.9.9.041
	>=media-libs/epsilon-0.3.0.011
	>=media-libs/emotion-0.0.1.008
	>=dev-libs/efreet-0.0.3.006"
DEPEND="${RDEPEND}
	doc? ( virtual/latex-base )"

pkg_setup() {
	if ! built_with_use media-libs/evas png ; then
		eerror "Re-emerge evas with USE=png"
		die "Re-emerge evas with USE=png"
	fi

	local flag
	for flag in fbcon opengl X ; do
		if use ${flag} ; then
			if ! built_with_use dev-libs/ecore ${flag} ; then
				eerror "Re-emerge ecore with USE=${flag}"
				die "Re-emerge ecore with USE=${flag}"
			fi
		fi
	done

	enlightenment_pkg_setup
}

src_compile() {
	export MY_ECONF="
		--enable-buffer
		$(use_enable X software-x11)
		$(use_enable X software-16-x11)
		$(use_enable X xrender-x11)
		$(use_enable opengl opengl-x11)
		$(use_enable fbcon)
	"
	enlightenment_src_compile
}
