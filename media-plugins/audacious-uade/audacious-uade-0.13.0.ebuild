EAPI=8

inherit autotools

DESCRIPTION="UADE plugin for Audacious and DeaDBeeF"
HOMEPAGE="https://github.com/mvtiaine/audacious-uade"
if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mvtiaine/audacious-uade.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/mvtiaine/${PN}/releases/download/${PV}/${PN}-${PV}.tar.bz2"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sh ~sparc ~x86"
fi

IUSE="+openmpt +libxmp +audacious deadbeef"
REQUIRED_USE="|| ( audacious deadbeef )"

LICENSE="GPL-2+"
SLOT="0"
DEPEND="
	openmpt? ( media-libs/libopenmpt )
	libxmp? ( media-libs/libxmp )
	audacious? ( media-sound/audacious )
	deadbeef? ( media-sound/deadbeef )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

DOCS=( AUTHORS README ChangeLog COPYING COPYING.LGPL NOTICE VERSION )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf

	myconf+=" --with-static-stdlibs=no"
	myconf+=" --enable-plugin-audacious=$(usex audacious) "
	myconf+=" --enable-plugin-deadbeef=$(usex deadbeef) "
	# no pkg-config support for DeaDBeeF
	myconf+=" --with-deadbeef-plugindir=${EPREFIX}/usr/$(get_libdir)/deadbeef "
	if use openmpt && use libxmp ; then
		myconf+=" --enable-players=all"
	fi
	econf ${myconf}
}
