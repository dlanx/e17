# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/edje/edje-9999.ebuild,v 1.6 2006/07/16 05:29:42 vapier Exp $

MY_P=${P/_beta/.beta}

inherit enlightenment

DESCRIPTION="graphical layout and animation library"
HOMEPAGE="http://www.enlightenment.org/pages/edje.html"
SRC_URI="http://download.enlightenment.org/releases/${MY_P}.tar.bz2"

KEYWORDS="~amd64 ~x86"
IUSE="debug cache static-libs vim-syntax"

DEPEND="dev-lang/lua
	>=dev-libs/eet-1.0.0_beta
	>=dev-libs/eina-1.0.0_beta
	>=dev-libs/embryo-1.0.0_beta
	>=x11-libs/evas-1.0.0_beta
	>=x11-libs/ecore-1.0.0_beta"
RDEPEND=${DEPEND}

S=${WORKDIR}/${MY_P}

src_compile() {
	export MY_ECONF="
		$(use_enable cache edje-program-cache)
		$(use_enable cache edje-calc-cache)
		$(use_enable !debug amalgamation)
		$(use_with vim-syntax vim /usr/share/vim)
	"
	enlightenment_src_compile
}

src_install() {
	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax/
		doins data/edc.vim edc.vim
	fi
	enlightenment_src_install
}
