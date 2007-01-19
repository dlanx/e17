# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/evas/evas-9999.ebuild,v 1.17 2006/09/11 03:45:25 vapier Exp $

inherit enlightenment flag-o-matic

DESCRIPTION="hardware-accelerated canvas API"

IUSE="altivec cairo directfb gif fbcon jpeg mmx opengl png sse svg tiff X xpm"

RDEPEND="X? ( x11-libs/libXrender )
	opengl? ( virtual/opengl )
	>=media-libs/imlib2-1.2.0
	>=dev-libs/eet-0.9.9
	>=dev-db/edb-1.0.5
	cairo? ( >=x11-libs/cairo-1.2 )
	directfb? ( >=dev-libs/DirectFB-0.9.16 )
	gif? ( media-libs/giflib )
	jpeg? ( media-libs/jpeg )
	png? ( media-libs/libpng )
	svg? ( gnome-base/librsvg )
	tiff? ( media-libs/tiff )
	dev-util/pkgconfig"
#	X? ( xcb-util )
DEPEND="${RDEPEND}
	X? ( x11-proto/xextproto x11-proto/xproto )"

src_compile() {
#		$(use_enable X software-xcb)
	export MY_ECONF="
		$(use_enable X software-x11) \
		$(use_enable directfb) \
		$(use_enable fbcon fb) \
		--enable-buffer \
		$(use_enable opengl gl-x11) \
		$(use_enable X xrender-x11) \
		$(use_enable gif image-loader-gif) \
		$(use_enable png image-loader-png) \
		$(use_enable jpeg image-loader-jpeg) \
		--enable-image-loader-eet \
		--enable-font-loader-eet \
		--enable-image-loader-edb \
		$(use_enable tiff image-loader-tiff) \
		$(use_enable xpm image-loader-xpm) \
		$(use_enable svg image-loader-svg) \
		$(use_enable mmx cpu-mmx) \
		$(use_enable sse cpu-sse) \
		$(use_enable altivec cpu-altivec) \
		$(use_enable cairo cairo-x11) \
		--enable-cpu-c \
		--enable-scale-sample \
		--enable-scale-smooth \
		--enable-convert-8-rgb-332 \
		--enable-convert-8-rgb-666 \
		--enable-convert-8-rgb-232 \
		--enable-convert-8-rgb-222 \
		--enable-convert-8-rgb-221 \
		--enable-convert-8-rgb-121 \
		--enable-convert-8-rgb-111 \
		--enable-convert-16-rgb-565 \
		--enable-convert-16-rgb-555 \
		--enable-convert-16-rgb-444 \
		--enable-convert-16-rgb-rot-0 \
		--enable-convert-16-rgb-rot-270 \
		--enable-convert-16-rgb-rot-90 \
		--enable-convert-24-rgb-888 \
		--enable-convert-24-bgr-888 \
		--enable-convert-32-rgb-8888 \
		--enable-convert-32-rgbx-8888 \
		--enable-convert-32-bgr-8888 \
		--enable-convert-32-bgrx-8888 \
		--enable-convert-32-rgb-rot-0 \
		--enable-convert-32-rgb-rot-270 \
		--enable-convert-32-rgb-rot-90 \
	"
	enlightenment_src_compile
}
