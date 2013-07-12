# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EFL_USE_GIT="yes"
EFL_GIT_BASE_PATH="git://github.com"
EFL_GIT_REPO_CATEGORY="dlanx"
EFL_GIT_REPO_NAME="elink"

inherit efl git-2

DESCRIPTION=""
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/efl
	media-libs/elementary"
RDEPEND="${DEPEND}"
