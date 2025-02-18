EAPI=8

inherit autotools

DESCRIPTION="UADE plugin for Audacious media player"
HOMEPAGE="https://github.com/mvtiaine/audacious-uade"
if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mvtiaine/audacious-uade.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/mvtiaine/${PN}/releases/download/${PV}/${PN}-${PV}.tar.bz2"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sh ~sparc ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""
DEPEND="
	media-sound/audacious
	media-libs/libopenmpt
	media-libs/libxmp
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
	econf --enable-players=all --enable-plugin-audacious=yes --with-static-stdlibs=no
}
