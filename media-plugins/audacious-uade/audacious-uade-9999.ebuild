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
	KEYWORDS="~amd64 ~arm64 ~m68k ~ppc64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""
DEPEND="
	media-sound/audacious
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

DOCS=( AUTHORS README ChangeLog COPYING NOTICE VERSION )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --enable-plugin-audacious=yes --with-static-stdlibs=no
}
