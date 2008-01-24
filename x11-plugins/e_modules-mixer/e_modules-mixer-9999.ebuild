# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

ECVS_MODULE="e_modules/${PN#e_modules-}"
inherit enlightenment

DESCRIPTION="e17 ${PN#e_modules-} module"

IUSE="alsa oss"

DEPEND=">=x11-wm/e-0.16.999
	>=media-libs/edje-0.5.0
	alsa? ( media-libs/alsa-lib )"

src_compile() {
	export MY_ECONF="
		$(use_enable alsa alsa) \
		$(use_enable oss oss) \
		"
	enlightenment_src_compile
}
