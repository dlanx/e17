# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit enlightenment

DESCRIPTION="library to simplify the use of devices"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Eeze"

IUSE="utilities static-libs"

DEPEND="dev-libs/ecore"
RDEPEND=${DEPEND}

src_configure() {
	MY_ECONF="
	$(use_enable utilities eeze-disk-ls)
	$(use_enable utilities eeze-mount)
	$(use_enable utilities eeze-umount)
	$(use_enable utilities eeze-udev-test)
	"

	enlightenment_src_configure
}
