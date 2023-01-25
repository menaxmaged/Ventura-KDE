#! /usr/bin/env bash

ROOT_UID=0

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  PLASMOID_DIR="/usr/share/plasma/plasmoids"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
  Cusrsor_DIR="/usr/share/icons"
  Icons_DIR="usr/share/icons"
  EMOJIS_DIR="usr/share/fonts/truetype/noto/"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
  PLASMOID_DIR="$HOME/.local/share/plasma/plasmoids"
  KVANTUM_DIR="$HOME/.config/Kvantum"
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
  Cusrsor_DIR="$HOME/.icons/"
  Icons_DIR="$HOME/.local/share/icons"
  Fonts_DIR="$HOME/.fonts"
fi

SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Monterey
LATTE_DIR="$HOME/.config/latte"

[[ ! -d ${AURORAE_DIR} ]] && mkdir -p ${AURORAE_DIR}
[[ ! -d ${SCHEMES_DIR} ]] && mkdir -p ${SCHEMES_DIR}
[[ ! -d ${PLASMA_DIR} ]] && mkdir -p ${PLASMA_DIR}
[[ ! -d ${LOOKFEEL_DIR} ]] && mkdir -p ${LOOKFEEL_DIR}
[[ ! -d ${KVANTUM_DIR} ]] && mkdir -p ${KVANTUM_DIR}
[[ ! -d ${WALLPAPER_DIR} ]] && mkdir -p ${WALLPAPER_DIR}
[[ ! -d ${Cusrsor_DIR} ]] && mkdir -p ${Cusrsor_DIR}
[[ ! -d ${Icons_DIR} ]] && mkdir -p ${Icons_DIR}
[[ ! -d ${PLASMOID_DIR} ]] && mkdir -p ${PLASMOID_DIR}
[[ ! -d ${Fonts_DIR} ]] && mkdir -p ${Fonts_DIR}

cp -rf "${SRC_DIR}"/configs/Xresources "$HOME"/.Xresources

install() {
  local name=${1}
  local color=${2}

  [[ -d ${AURORAE_DIR}/${name} ]] && rm -rf ${AURORAE_DIR}/${name}*
  [[ -d ${PLASMA_DIR}/${name} ]] && rm -rf ${PLASMA_DIR}/${name}*
  [[ -f ${SCHEMES_DIR}/${name}.colors ]] && rm -rf ${SCHEMES_DIR}/${name}*.colors
  [[ -d ${LOOKFEEL_DIR}/com.github.vinceliuice.${name} ]] && rm -rf ${LOOKFEEL_DIR}/com.github.vinceliuice.${name}*
  [[ -d ${KVANTUM_DIR}/${name} ]] && rm -rf ${KVANTUM_DIR}/${name}*
  [[ -d ${WALLPAPER_DIR}/${name} ]] && rm -rf ${WALLPAPER_DIR}/${name}*
  [[ -f ${LATTE_DIR}/${name}.layout.latte ]] && rm -rf ${LATTE_DIR}/${name}.layout.latte

  cp -r ${SRC_DIR}/aurorae/*                                                         ${AURORAE_DIR}
  cp -r ${SRC_DIR}/Kvantum/*                                                         ${KVANTUM_DIR}
  cp -r ${SRC_DIR}/color-schemes/*                                                   ${SCHEMES_DIR}
  cp -r ${SRC_DIR}/plasma/desktoptheme/${name}*                                      ${PLASMA_DIR}
  cp -r ${SRC_DIR}/plasma/desktoptheme/icons                                         ${PLASMA_DIR}/${name}
  cp -r ${SRC_DIR}/plasma/desktoptheme/icons                                         ${PLASMA_DIR}/${name}-dark
  cp -r ${SRC_DIR}/plasma/look-and-feel/*                                            ${LOOKFEEL_DIR}
  cp -r ${SRC_DIR}/plasma/plasmoids/*                                                ${PLASMOID_DIR}
  cp -r ${SRC_DIR}/wallpaper/${name}*                                                ${WALLPAPER_DIR}
  cp -r ${SRC_DIR}/icons/cursors/*                                                   ${Cusrsor_DIR}
  cp -r ${SRC_DIR}/icons/icons/*                                                     ${Icons_DIR}
  cp -r ${SRC_DIR}/fonts/*                                                           ${fonts_DIR}
  cp -r ${SRC_DIR}/fonts/NotoColorEmoji.ttf                                          ${EMOJIS_DIR}
  [[ -d ${LATTE_DIR} ]] && cp -r ${SRC_DIR}/latte-dock/*                             ${LATTE_DIR}
}

echo "Installing '${THEME_NAME} kde themes'..."

install "${name:-${THEME_NAME}}"

echo "Install finished..."
