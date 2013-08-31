# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_SUB_PROJECT="core"
EGIT_URI_APPEND=${PN}
EGIT_BRANCH=${PN}-0.17

inherit enlightenment

DESCRIPTION="Enlightenment DR17 window manager"

LICENSE="BSD-2"
SLOT="0.17/${PV}"

# The @ is just an anchor to expand from
__EVRY_MODS=""
__CONF_MODS="
	+@applications +@dialogs +@display +@edgebindings
	+@interaction +@intl +@keybindings +@menus
	+@paths +@performance +@randr +@shelves +@theme
	+@wallpaper2 +@window-manipulation +@window-remembers"
__NORM_MODS="
	@access +@backlight +@battery +@clock +@connman +@cpufreq +@dropshadow
	+@everything +@fileman +@fileman-opinfo +@gadman +@ibar +@ibox +@illume2
	+@mixer	+@msgbus +@notification +@pager @physics +@quickaccess +@shot +@start
	+@syscon +@systray +@tasks +@temperature +@tiling +@winlist +@wizard +@xkbswitch"
IUSE_E_MODULES="
	${__CONF_MODS//@/enlightenment_modules_conf-}
	${__NORM_MODS//@/enlightenment_modules_}"

IUSE="emotion pam spell static-libs +udev ukit ${IUSE_E_MODULES}"

RDEPEND="
	pam? ( sys-libs/pam )
	>=dev-libs/eet-1.7.8
	>=dev-libs/efreet-1.7.8
	>=dev-libs/eio-1.7.8
	>=dev-libs/eina-1.7.8[mempool-chained]
	|| ( >=dev-libs/ecore-1.7.8[X,evas,inotify] >=dev-libs/ecore-1.7.4[xcb,evas,inotify] )
	>=media-libs/edje-1.7.8
	>=dev-libs/e_dbus-1.7.8[libnotify,udev?]
	ukit? ( >=dev-libs/e_dbus-1.7.8[udev] )
	enlightenment_modules_connman? ( >=dev-libs/e_dbus-1.7.8[connman] )
	enlightenment_modules_physics? ( >=dev-libs/ephysics-9999 )
	enlightenment_modules_shot? ( >=dev-libs/ecore-1.7.8[curl] )
	|| ( >=media-libs/evas-1.7.8[eet,X,jpeg,png] >=media-libs/evas-1.7.8[eet,xcb,jpeg,png] )
	>=dev-libs/eeze-1.7.8
	emotion? ( >=media-libs/emotion-1.7.8 )
	x11-libs/xcb-util-keysyms"
DEPEND="${RDEPEND}"

src_prepare() {
#	epatch "${FILESDIR}"/quickstart.diff
	enlightenment_src_prepare
}

src_configure() {
	E_ECONF+=(
		--disable-install-sysactions
		--disable-elementary
		$(use_enable doc)
		--disable-device-hal
		$(use_enable emotion)
		--disable-mount-hal
		$(use_enable nls)
		$(use_enable pam)
		--enable-device-udev
		$(use_enable udev mount-eeze)
		$(use_enable ukit mount-udisks)
	)
	local u c
	for u in ${IUSE_E_MODULES} ; do
		u=${u#+}
		c=${u#enlightenment_modules_}
		E_ECONF+=( $(use_enable ${u} ${c}) )
	done
	enlightenment_src_configure
}

src_install() {
	enlightenment_src_install
	insinto /etc/enlightenment
	newins "${FILESDIR}"/gentoo-sysactions.conf sysactions.conf
}
