# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

E_PKG_IUSE="doc nls"

inherit efl flag-o-matic

DESCRIPTION="Generic Players using Emotion"
HOMEPAGE="http://enlightenment.org/"

IUSE="nls cdda cddb dvd curl lirc upnp xml X"

RDEPEND=">=dev-libs/efl-1.8.0
"

DEPEND="${RDEPEND}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

src_configure() {
	local myconf="
		--enable-activity-tv
		--enable-activity-games
		--enable-browser-podcasts
		--enable-browser-shoutcast
		--enable-browser-netstreams
		$(use_enable nls)
		$(use_enable cddb libcddb)
		$(use_enable curl libcurl)
		$(use_enable dvd browser-dvd)
		$(use_enable cdda browser-cdda)
		$(use_enable upnp browser-upnp)
		$(use_enable xml libxml2)
		$(use_enable X libxrandr)
	"

	econf ${myconf} || die "configure failed"
}

src_install() {
	 emake DESTDIR="${D}" install || die "install failed"

	dodoc AUTHORS README
}
