# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/e_modules/e_modules-9999.ebuild,v 1.6 2006/09/14 15:21:04 vapier Exp $

inherit enlightenment

DESCRIPTION="e_modules meta package - merge this to pull in all e_modules"

IUSE="broken-modules"

DEPEND="x11-plugins/e_modules-alarm
	x11-plugins/e_modules-bling
	broken-modules? ( x11-plugins/e_modules-calendar )
	x11-plugins/e_modules-cpu
	x11-plugins/e_modules-deskshow
	x11-plugins/e_modules-emu
	broken-modules? ( x11-plugins/e_modules-engage )
	x11-plugins/e_modules-flame
	x11-plugins/e_modules-language
	x11-plugins/e_modules-mail
	x11-plugins/e_modules-mem
	x11-plugins/e_modules-mixer
	x11-plugins/e_modules-moon
	x11-plugins/e_modules-net
	x11-plugins/e_modules-photo
	x11-plugins/e_modules-rain
	x11-plugins/e_modules-screenshot
	x11-plugins/e_modules-slideshow
	x11-plugins/e_modules-snow
	x11-plugins/e_modules-taskbar
	x11-plugins/e_modules-tclock
	x11-plugins/e_modules-uptime
	x11-plugins/e_modules-weather
	x11-plugins/e_modules-winselector
	x11-plugins/e_modules-wlan"

src_unpack() { :; }
src_compile() { :; }
src_install() { :; }
