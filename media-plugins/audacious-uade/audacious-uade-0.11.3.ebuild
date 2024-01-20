EAPI=8

DESCRIPTION="UADE plugin for Audacious media player"
HOMEPAGE="https://github.com/mvtiaine/audacious-uade"
SRC_URI="https://github.com/mvtiaine/${PN}/releases/download/${PV}/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

DEPEND="
	media-sound/audacious
	dev-libs/libbsd
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

DOCS=( AUTHORS README ChangeLog COPYING NOTICE VERSION )
