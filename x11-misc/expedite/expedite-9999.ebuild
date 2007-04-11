# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit enlightenment

DESCRIPTION="Comprehensive test suite for Evas"

IUSE="X opengl"

RDEPEND=">=x11-libs/evas-9999"
DEPEND="${RDEPEND}"

pkg_setup() {
	local flag
	for flag in opengl X ; do
		if use ${flag} ; then
			if ! built_with_use x11-libs/ecore ${flag} ; then
				eerror "Re-emerge ecore with USE=${flag}"
				die "Re-emerge ecore with USE=${flag}"
			fi
		fi
	done

	enlightenment_pkg_setup
}
