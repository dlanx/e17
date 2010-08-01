# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/eet/eet-9999.ebuild,v 1.4 2005/03/25 17:51:29 vapier Exp $

EAPI=2

inherit enlightenment

DESCRIPTION="E file chunk reading/writing library"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Eet"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/eina
	media-libs/jpeg
	sys-libs/zlib
	gnutls? ( net-libs/gnutls )
	!gnutls? ( ssl? ( dev-libs/openssl ) )
	test? ( dev-libs/check )"
RDEPEND="${DEPEND}
	test? ( dev-util/lcov )"

IUSE="debug examples gnutls ssl +threads"

src_configure() {
	local SSL_FLAGS=""

	if use gnutls; then
		if use ssl; then
			ewarn "You have enabled both 'ssl' and 'gnutls', so we will use"
			ewarn "gnutls and not openssl for cipher and signature support"
		fi
		SSL_FLAGS="
			--enable-cipher
			--enable-signature
			--disable-openssl
			--enable-gnutls"
	elif use ssl; then
		SSL_FLAGS="
			--enable-cipher
			--enable-signature
			--enable-openssl
			--disable-gnutls"
	else
		SSL_FLAGS="
			--disable-cipher
			--disable-signature
			--disable-openssl
			--disable-gnutls"
	fi

	export MY_ECONF="
		$(use_enable !debug amalgamation)
		$(use_enable debug assert)
		$(use_enable doc)
		$(use_enable test tests)
		$(use_enable test coverage)
		$(use_enable threads pthread)
		${SSL_FLAGS}
		${MY_ECONF}"

	enlightenment_src_configure
}

src_install() {
	enlightenment_src_install
	rm -r src/examples/Makefile* || die
	docinto examples
	dodoc src/examples/* || die
}
