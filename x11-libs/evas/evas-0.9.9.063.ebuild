# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/evas/evas-9999.ebuild,v 1.17 2006/09/11 03:45:25 vapier Exp $

E_SNAP_DATE="2009-12-02"
inherit enlightenment

DESCRIPTION="hardware-accelerated canvas API"

IUSE="altivec directfb edb gif fbcon jpeg mmx opengl png sdl sse svg threads tiff X xcb xpm"

RDEPEND="edb? ( >=dev-db/edb-1.0.5.042 )
	directfb? ( >=dev-libs/DirectFB-0.9.16 )
	>=dev-libs/eet-1.2.3
	>=dev-libs/eina-0.9.9.063
	media-libs/fontconfig
	gif? ( media-libs/giflib )
	jpeg? ( media-libs/jpeg )
	png? ( media-libs/libpng )
	sdl? ( media-libs/libsdl )
	tiff? ( media-libs/tiff )
	xpm? ( x11-libs/libXpm )
	svg? ( >=gnome-base/librsvg-2.14.0 x11-libs/cairo x11-libs/libsvg-cairo )
	opengl? ( virtual/opengl )
	X? ( x11-libs/libXrender )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	X? (
		x11-proto/xextproto
		x11-proto/xproto
	)"

src_compile() {
	# other *very* fun options:
	#  --enable-cpu-mmx                enable mmx code
	#  --enable-cpu-sse                enable sse code
	#  --enable-scale-sample           enable sampling scaler code
	#  --enable-scale-smooth           enable sampling scaler code
	#  --enable-pthreads               enable threaded renderer
	export MY_ECONF="
		$(use_enable mmx cpu-mmx) \
		$(use_enable sse cpu-mmx) \
		$(use_enable sse cpu-sse) \
		$(use_enable X simple-x11) \
		$(use_enable X software-16-x11) \
		$(use_enable X xrender-x11) \
		$(use_enable sdl software-sdl) \
		$(use_enable sdl sdl-primitive) \
		$(use_enable opengl gl-x11) \
		$(use_enable directfb) \
		$(use_enable fbcon fb) \
		$(use_enable xcb software-xcb) \
		$(use_enable xcb xrender-xcb) \
		$(use_enable gif image-loader-gif) \
		$(use_enable png image-loader-png) \
		$(use_enable jpeg image-loader-jpeg) \
		$(use_enable tiff image-loader-tiff) \
		$(use_enable xpm image-loader-xpm) \
		$(use_enable svg image-loader-svg) \
		$(use_enable altivec cpu-altivec) \
		--enable-buffer \
		--enable-image-loader-eet \
		$(use_enable edb image-loader-edb) \
		--enable-font-loader-eet \
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
		$(use_enable threads pthreads) \
	"
	enlightenment_src_compile
}