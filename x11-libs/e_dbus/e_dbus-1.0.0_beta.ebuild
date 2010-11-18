# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P=${P/_beta/.beta}

inherit enlightenment

DESCRIPTION="Enlightenment's (Ecore) integration to DBus"
SRC_URI="http://download.enlightenment.org/releases/${MY_P}.tar.bz2"

KEYWORDS="~amd64 ~x86"
IUSE="bluetooth +connman +hal +libnotify ofono static-libs ukit"

RDEPEND=">=dev-libs/eina-1.0.0_beta
	>=x11-libs/ecore-1.0.0_beta
	sys-apps/dbus
	libnotify? ( >=dev-libs/evas-1.0.0_beta )
	hal? ( sys-apps/hal )
	ukit? ( sys-power/upower sys-fs/udisks )
"
DEPEND="${RDEPEND}"
S=${WORKDIR}/${MY_P}

src_configure() {
	MY_ECONF="
	$(use_enable bluetooth ebluez)
	$(use_enable connman econnman)
	$(use_enable doc)
	$(use_enable hal ehal)
	$(use_enable libnotify enotify)
	$(use_enable ofono eofono)
	$(use_enable ukit eukit)
	"
	enlightenment_src_configure
}
