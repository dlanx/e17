# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/evas/evas-0.9.9.030.ebuild,v 1.1 2006/07/16 05:03:06 vapier Exp $

inherit enlightenment

DESCRIPTION="hardware-accelerated canvas API"

IUSE="cairo mmx sse X opengl directfb fbcon gif png jpeg tiff xpm svg altivec"

RDEPEND="X? ( || ( x11-libs/libXrender virtual/x11 ) )
	>=dev-libs/eet-0.9.10.037
	>=dev-db/edb-1.0.5.007
	dev-util/pkgconfig
	media-libs/fontconfig
	cairo? ( >=x11-libs/cairo-0.2.0 )
	directfb? ( >=dev-libs/DirectFB-0.9.16 )
	gif? ( media-libs/giflib )
	png? ( media-libs/libpng )
	jpeg? ( media-libs/jpeg )
	tiff? ( media-libs/tiff )
	xpm? ( x11-libs/libXpm )
	svg? ( gnome-base/librsvg x11-libs/cairo x11-libs/libsvg-cairo )"
#	X? ( xcb-util )
DEPEND="${RDEPEND}
	X? ( || ( (	x11-proto/xextproto
			x11-proto/xproto )
			virtual/x11 ) )"

src_compile() {
	# other *very* fun options:
	#  --enable-cpu-mmx                enable mmx code
	#  --enable-cpu-sse                enable sse code
	#  --enable-scale-sample           enable sampling scaler code
	#  --enable-scale-smooth           enable sampling scaler code
	#  --enable-pthreads               enable threaded renderer
	export MY_ECONF="
		$(use_enable cairo cairo-x11)
		$(use_enable mmx cpu-mmx) \
		$(use_enable sse cpu-mmx) \
		$(use_enable sse cpu-sse) \
		$(use_enable X software-x11) \
		$(use_enable opengl gl-x11) \
		$(use_enable directfb) \
		$(use_enable fbcon fb) \
		$(use_enable gif image-loader-gif) \
		$(use_enable png image-loader-png) \
		$(use_enable jpeg image-loader-jpeg) \
		$(use_enable tiff image-loader-tiff) \
		$(use_enable xpm image-loader-xpm) \
		$(use_enable svg image-loader-svg) \
		$(use_enable altivec cpu-altivec) \
		--enable-image-loader-eet \
		--enable-image-loader-edb \
		--enable-fmemopen \
		--enable-cpu-c \
		--enable-scale-smooth \
		--enable-scale-sample \
		--enable-convert-8-rgb-332 \
		--enable-convert-8-rgb-666 \
		--enable-convert-8-rgb-232 \
		--enable-convert-8-rgb-222 \
		--enable-convert-8-rgb-221 \
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
		--disable-pthreads
	"
	enlightenment_src_compile
}
