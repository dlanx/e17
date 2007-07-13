# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/ecore/ecore-9999.ebuild,v 1.14 2006/10/29 03:27:50 vapier Exp $

inherit enlightenment

DESCRIPTION="core event abstraction layer and X abstraction layer (nice convenience library)"

IUSE="X directfb fbcon opengl ssl curl"

RDEPEND=">=x11-libs/evas-0.9.9
	X? (
		x11-libs/libXcursor
		x11-libs/libXp
		x11-libs/libXinerama
		x11-libs/libXrandr
		x11-libs/libXScrnSaver
		x11-libs/libXrender
		x11-libs/libXfixes
		x11-libs/libXdamage
	)
	directfb? ( >=dev-libs/DirectFB-0.9.16 )
	ssl? ( dev-libs/openssl )
	curl? ( net-misc/curl )
	opengl? ( virtual/opengl )"
DEPEND="${RDEPEND}
	X? (
		x11-proto/xproto
		x11-proto/xextproto
		x11-proto/printproto
		x11-proto/xineramaproto
		x11-proto/scrnsaverproto
	)"

src_compile() {
	export MY_ECONF="
		--enable-ecore-txt
		--enable-ecore-job
		--enable-ecore-evas
		--enable-ecore-evas-buffer
		--enable-ecore-con
		--enable-ecore-ipc
		--enable-ecore-config
		--enable-ecore-file
		--enable-ecore-desktop
		--enable-inotify
		--disable-ecore-x-xcb
		$(use_enable X ecore-x)
		$(use_enable X ecore-evas-x11-16)
		$(use_enable X evas-xrender)
		$(use_enable fbcon ecore-fb)
		$(use_enable directfb ecore-dfb)
		$(use_enable directfb ecore-evas-dfb)
		$(use_enable opengl ecore-evas-gl)
		$(use_enable fbcon ecore-evas-fb)
		$(use_enable ssl openssl)
		$(use_enable curl)
	"
	enlightenment_src_compile
}
