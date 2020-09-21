#!/usr/bin/bash
#
#   depends.sh - Check the 'depends' array conforms to requirements.
#
#   Copyright (c) 2014-2018 Pacman Development Team <pacman-dev@archlinux.org>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

[[ -n "$LIBMAKEPKG_LINT_PKGBUILD_DEPENDS_SH" ]] && return
LIBMAKEPKG_LINT_PKGBUILD_DEPENDS_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/lint_pkgbuild/pkgname.sh"
source "$LIBRARY/lint_pkgbuild/pkgver.sh"
source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/pkgbuild.sh"


lint_pkgbuild_functions+=('lint_depends')


lint_depends() {
	local depends_list depend name ver ret=0

	get_pkgbuild_all_split_attributes depends depends_list

	# this function requires extglob - save current status to restore later
	local shellopts=$(shopt -p extglob)
	shopt -s extglob

	for depend in "${depends_list[@]}"; do
		name=${depend%%@(<|>|=|>=|<=)*}
		# remove optional epoch in version specifier
		ver=${depend##$name@(<|>|=|>=|<=)?(+([0-9]):)}
		lint_one_pkgname depends "$name" || ret=1
		# Don't validate empty version because of https://bugs.archlinux.org/task/58776
		if [[ $ver != $depend && -n $ver ]]; then
			# remove optional pkgrel in version specifier
			check_pkgver "${ver%-+([0-9])?(.+([0-9]))}" depends || ret=1
		fi
	done

	eval "$shellopts"

	return $ret
}
