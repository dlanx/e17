# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit enlightenment flag-o-matic

DESCRIPTION="Load and control programs compiled in small"

IUSE=""

src_compile() {
	# embryo_amx.c will hang graphite when processed
	# Probably we should post a bug on gcc
	# But it's nearly impossible to understand what this one giant hack does.
	# Maybe later, by now we will just filter this flags out.

	ewarn "Filtering -floop* FLAGS"
	filter-flags -floop*

	enlightenment_src_compile
}
