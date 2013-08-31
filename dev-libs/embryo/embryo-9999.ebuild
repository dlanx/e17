# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_SUB_PROJECT="legacy"
EGIT_URI_APPEND=${PN}
EGIT_BRANCH=${PN}-1.7

inherit enlightenment

DESCRIPTION="load and control programs compiled in embryo language (small/pawn variant)"

IUSE="static-libs"

DEPEND=">=dev-libs/eina-9999"
RDEPEND=${DEPEND}
