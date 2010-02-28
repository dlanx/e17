# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/enlightenment.eclass,v 1.80 2009/03/07 22:28:16 vapier Exp $
#
# Author: vapier@gentoo.org
# Modified: barbieri@profusion.mobi
# Modified: NightNord@gmail.com

inherit eutils libtool flag-o-matic

# E_STATE's:
#	release      [default]
#		KEYWORDS arch
#		SRC_URI  $P.tar.gz
#		S        $WORKDIR/$P
#
#	snap         $PV has .200##### datestamp or .### counter
#		KEYWORDS ~arch
#		SRC_URI  $P.tar.bz2
#		S        $WORKDIR/$P
#
#	live         $PV has a 9999 marker
#		KEYWORDS ""
#		SRC_URI  svn/etc... up
#		S        $WORKDIR/$ESVN_URI_APPEND
#
# Overrides:
#	KEYWORDS    EKEY_STATE
#	SRC_URI     EURI_STATE
#	S           EURI_STATE
#
# E_OLD_PROJECT: if defined, fetch from OLD outside trunk
# E_NO_NLS: if defined, the package do not support NLS (gettext)
# E_NO_DOC: if defined, the package do not support documentation (doxygen)
# E_NO_VISIBILITY: if defined, the package do not support -fvisibility=hidden
# E_NO_DISABLE_STATIC: if defined, do not append --disable-static
#
# Python support:
# E_PYTHON: if defined, the package is Python/distutils
# E_CYTHON: if defined, the package is Cython bindings (implies E_PYTHON)
# E_NO_EXAMPLES: if defined, the Python package does not provide examples

E_LIVE_SERVER_DEFAULT="http://svn.enlightenment.org/svn/e"

E_STATE="release"

if [[ ${PV/9999} != ${PV} ]] ; then
	E_STATE="live"
	PROPERTIES="live"

	: ${WANT_AUTOTOOLS:=yes}

	[[ -n ${E_LIVE_OFFLINE} ]] && ESCM_OFFLINE="yes"

	: ${E_LIVE_SERVER:=${E_LIVE_SERVER_DEFAULT}}

	if [[ -z "${E_OLD_PROJECT}" ]]; then
		ESVN_BRANCH="trunk"
	else
		ESVN_BRANCH="OLD"
	fi

	ESVN_URI_BASE="${E_LIVE_SERVER}/${ESVN_BRANCH}"
	ESVN_URI_APPEND=${ESVN_URI_APPEND:-${PN}}

	ESVN_PROJECT="enlightenment/${ESVN_BRANCH}/${ESVN_SUB_PROJECT}"

	ESVN_REPO_URI=${ESVN_URI_BASE}/${ESVN_SUB_PROJECT}/${ESVN_URI_APPEND}

	inherit subversion
elif [[ -n ${E_SNAP_DATE} ]] ; then
	E_STATE="snap"
else
	E_STATE="release"
fi

if [[ ! -z "${E_CYTHON}" ]]; then
	E_PYTHON="yes"
fi

if [[ ! -z "${E_PYTHON}" ]]; then
	WANT_AUTOTOOLS="no"

	E_NO_VISIBILITY="yes"

	NEED_PYTHON="2.4"

	inherit python distutils
fi

if [[ ${WANT_AUTOTOOLS} == "yes" ]] ; then
	: ${WANT_AUTOCONF:=${E_WANT_AUTOCONF:-latest}}
	: ${WANT_AUTOMAKE:=${E_WANT_AUTOMAKE:-latest}}

	inherit autotools
fi

HOMEPAGE="http://www.enlightenment.org/"
case ${EURI_STATE:-${E_STATE}} in
	release) SRC_URI="mirror://sourceforge/enlightenment/${P}.tar.gz";;
	snap)    SRC_URI="http://download.enlightenment.org/snapshots/${E_SNAP_DATE}/${P}.tar.bz2";;
	live)    SRC_URI="";;
esac

LICENSE="BSD"
SLOT="0"

case ${EKEY_STATE:-${E_STATE}} in
	release) KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 sh sparc x86 ~x86-fbsd";;
	snap)    KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd";;
	live)    KEYWORDS="";;
esac

if [[ -z "${E_NO_NLS}" ]]; then
	IUSE="${IUSE} nls"
	DEPEND="${DEPEND} nls? ( sys-devel/gettext )"

	# gettext (via `autopoint`) needs to run cvs #245073
	if [[ ${E_STATE} == "live" ]] && [[ ${WANT_AUTOTOOLS} == "yes" ]]; then
		DEPEND="${DEPEND} dev-util/cvs"
	fi
fi

if [[ -z "${E_NO_DOC}" ]]; then
	IUSE="${IUSE} doc"
	DEPEND="${DEPEND} doc? ( app-doc/doxygen )"
fi

if [[ ! -z "${E_CYTHON}" ]]; then
	DEPEND="${DEPEND} >=dev-python/cython-0.12"
fi

if [[ ! -z "${E_PYTHON}" ]]; then
	DEPEND="${DEPEND} >=dev-python/setuptools-0.6_rc9"

	if [[ -z "${E_NO_EXAMPLES}" ]]; then
		IUSE="${IUSE} examples"
	fi
else
	DEPEND="${DEPEND} dev-util/pkgconfig"
fi

if [[ -z "${E_NO_VISIBILITY}" ]] && [[ $(gcc-major-version) -ge 4 ]]; then
	append-flags -fvisibility=hidden
fi

case ${EURI_STATE:-${E_STATE}} in
	release) S="${WORKDIR}"/${P};;
	snap)    S="${WORKDIR}"/${P};;
	live)    S="${WORKDIR}"/${ESVN_URI_APPEND};;
esac

efl_warning_msg() {
	if [[ "${E_LIVE_SERVER}" != "${E_LIVE_SERVER_DEFAULT}" ]] ; then
		ewarn "Using user server for live sources: ${E_LIVE_SERVER}"
	fi

	if [[ ${E_STATE} == "snap" ]] ; then
		ewarn "Please do not contact the E team about bugs in Gentoo."
		ewarn "Only contact enlightenment@gentoo.org via e-mail or bugzilla."
		ewarn "Remember, this stuff is DEV only code so dont cry when"
		ewarn "I break you :)."
	elif [[ ${E_STATE} == "live" ]] ; then
		eerror "This is a LIVE SOURCES ebuild."
		eerror "That means there are NO promises it will work."
		eerror "If it fails to build, FIX THE CODE YOURSELF"
		eerror "before reporting any issues."
	fi
}

efl_die() {
	efl_warning_msg
	die "$@"$'\n'"!!! SEND BUG REPORTS TO enlightenment@gentoo.org NOT THE E TEAM"
}

efl_src_test() {
	emake -j1 check || die "Make check failed. see above for details"
}

# the stupid gettextize script prevents non-interactive mode, so we hax it
gettext_modify() {
	[[ -z "${E_NO_NLS}" ]] || return 0
	use nls || return 0
	
	cp $(type -P gettextize) "${T}"/ || die "could not copy gettextize"
	sed -i \
		-e 's:read dummy < /dev/tty::' \
		"${T}"/gettextize
}

efl_src_unpack() {
	if [[ ${E_STATE} == "live" ]] ; then
		subversion_src_unpack
	else
		unpack ${A}
	fi

	cd "${S}"
}

efl_src_prepare() {
	gettext_modify

	[[ -s gendoc ]] && chmod a+rx gendoc

	if [[ -z "${E_PYTHON}" ]]; then
		if [[ -e configure.ac || -e configure.in ]] && \
									[[ "${WANT_AUTOTOOLS}" == "yes" ]]; then
			local macro_regex='^[[:space:]]*AM_GNU_GETTEXT_VERSION'

			if [[ -z "${E_NO_NLS}" ]]; then
				local x=

				for x in configure.{ac,in}; do
					if [[ -r ${x} ]] && grep -qE "${macro_regex}" ${x}; then
						eautopoint -f
						break;
					fi
				done
			fi

			# autotools expect README, when README.in is around, but README
			# is created later in configure step
			[[ -f README.in ]] && touch README

			eautoreconf
		fi

		epunt_cxx
		elibtoolize
	fi
}

efl_src_configure() {
	if [[ -z "${E_PYTHON}" ]] && [[ -x ${ECONF_SOURCE:-.}/configure ]]; then
		[[ -z "${E_NO_NLS}" ]] && MY_ECONF+=" $(use_enable nls)"
		[[ -z "${E_NO_DOC}" ]] && MY_ECONF+=" $(use_enable doc)"
		[[ -z "${E_NO_DISABLE_STATIC}" ]] && MY_ECONF+=" --disable-static"

		econf ${MY_ECONF} || efl_die "configure failed"
	fi
}

efl_src_compile() {
	if [[ -z "${E_PYTHON}" ]]; then
		emake || efl_die "emake failed"

		if [[ -z "${E_NO_DOC}" ]] && use doc && ! [[ -x ./gendoc ]]; then
			emake doc || efl_die "emake doc failed"
		fi
	else
		distutils_src_compile
	fi

	if [[ -z "${E_NO_DOC}" ]] && use doc && [[ -x ./gendoc ]]; then
		./gendoc || efl_die "gendoc failed"
	fi
}

efl_src_install() {
	if [[ -z "${E_PYTHON}" ]]; then
		emake install DESTDIR="${D}" || efl_die

		find "${D}" -name '*.la' -delete

		local doc

		for doc in AUTHORS ChangeLog NEWS README TODO ${EDOCS}; do
			[[ -f ${doc} ]] && dodoc ${doc}
		done
	else
		distutils_src_install

		if [[ -z "${E_NO_EXAMPLES}" ]] && use examples; then
			insinto /usr/share/doc/${PF}
			doins -r examples
		fi
	fi

	if [[ -z "${E_NO_DOC}" ]] && use doc && [[ -d doc ]]; then
		if [[ -d doc/html ]]; then
			dohtml -r doc/html/*
		else
			dohtml -r doc/*
		fi
	fi

	find "${D}" -name .svn -type d -exec rm -rf '{}' \; 2>/dev/null
}

EXPORT_FUNCTIONS src_unpack src_prepare src_configure src_compile src_install src_test