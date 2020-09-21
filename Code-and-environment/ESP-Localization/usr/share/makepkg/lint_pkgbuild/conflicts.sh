#!/usr/bin/bash
#
#   conflicts.sh - Check the 'conflicts' array conforms to requirements.
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

[[ -n "$LIBMAKEPKG_LINT_PKGBUILD_CONFLICTS_SH" ]] && return
LIBMAKEPKG_LINT_PKGBUILD_CONFLICTS_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/lint_pkgbuild/pkgname.sh"
source "$LIBRARY/lint_pkgbuild/pkgver.sh"
source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/pkgbuild.sh"


lint_pkgbuild_functions+=('lint_conflicts')


lint_conflicts() {
	local conflicts_list conflict name ver ret=0

	get_pkgbuild_all_split_attributes conflicts conflicts_list

	# this function requires extglob - save current status to restore later
	local shellopts=$(shopt -p extglob)
	shopt -s extglob

	for conflict in "${conflicts_list[@]}"; do
		name=${conflict%%@(<|>|=|>=|<=)*}
		# remove optional epoch in version specifier
		ver=${conflict##$name@(<|>|=|>=|<=)?(+([0-9]):)}
		lint_one_pkgname conflicts "$name" || ret=1
		if [[ $ver != $conflict ]]; then
			# remove optional pkgrel in version specifier
			check_pkgver "${ver%-+([0-9])?(.+([0-9]))}" conflicts || ret=1
		fi
	done

	eval "$shellopts"

	return $ret
}
