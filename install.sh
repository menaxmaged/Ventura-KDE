#! /usr/bin/env bash

ROOT_UID=0
: '
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
  Icons_DIR="/usr/share/icons"
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
'
if [ "$UID" -eq "$ROOT_UID" ]; then
 echo "Please run this script as a nosudo al user"
 exit
fi
CONF_DIR="$HOME/.config/"
SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Ventura
LATTE_DIR="$HOME/.config/latte"

cp -rf "${SRC_DIR}"/configs/Xresources "$HOME"/.Xresources

install_icons(){
git clone https://github.com/menaxmaged/MacOS-icon-theme.git
cd MacOS-icon-theme
sudo ./install.sh
cd ..

}

install_gtk(){
git clone https://github.com/menaxmaged/MacOS-gtk-theme.git
cd MacOS-gtk-theme
sudo ./install.sh
cd ..

}


install_sddm(){

cd sddm
sudo ./install.sh
cd ..

}


install() {
  local name=${1}
  local color=${2}
   AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  PLASMOID_DIR="/usr/share/plasma/plasmoids"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
  Cusrsor_DIR="/usr/share/icons"
  Icons_DIR="/usr/share/icons"
 fonts_DIR="/usr/share/fonts/noto/"
  SHARE_DIR="/usr/share/"

 [[ ! -d ${AURORAE_DIR} ]] && sudo mkdir -p ${AURORAE_DIR}
 [[ ! -d ${SCHEMES_DIR} ]] && sudo mkdir -p ${SCHEMES_DIR}
 [[ ! -d ${PLASMA_DIR} ]] && sudo mkdir -p ${PLASMA_DIR}
 [[ ! -d ${LOOKFEEL_DIR} ]] && sudo mkdir -p ${LOOKFEEL_DIR}
 [[ ! -d ${KVANTUM_DIR} ]] && sudo mkdir -p ${KVANTUM_DIR}
 [[ ! -d ${WALLPAPER_DIR} ]] && sudo mkdir -p ${WALLPAPER_DIR}
 [[ ! -d ${Cusrsor_DIR} ]] && sudo mkdir -p ${Cusrsor_DIR}
 [[ ! -d ${Icons_DIR} ]] && sudo mkdir -p ${Icons_DIR}
 [[ ! -d ${PLASMOID_DIR} ]] && sudo mkdir -p ${PLASMOID_DIR}


 [[ -d ${AURORAE_DIR}/${name} ]] && sudo rm -rf ${AURORAE_DIR}/${name}*
 [[ -d ${PLASMA_DIR}/${name} ]] && sudo rm -rf ${PLASMA_DIR}/${name}*
 [[ -f ${SCHEMES_DIR}/${name}.colors ]] && sudo rm -rf ${SCHEMES_DIR}/${name}*.colors
 [[ -d ${LOOKFEEL_DIR}/com.github.mena.${name} ]] && sudo rm -rf ${LOOKFEEL_DIR}/com.github.mena.${name}*
 [[ -d ${KVANTUM_DIR}/${name} ]] && sudo rm -rf ${KVANTUM_DIR}/${name}*
 [[ -d ${WALLPAPER_DIR}/${name} ]] && sudo rm -rf ${WALLPAPER_DIR}/${name}*
  [[ -f ${LATTE_DIR}/${name}.layout.latte ]] && sudo rm -rf ${LATTE_DIR}/${name}.layout.latte

sudo  cp -r ${SRC_DIR}/share/*                                                           ${SHARE_DIR}
sudo  cp -r ${SRC_DIR}/aurorae/*                                                         ${AURORAE_DIR}
sudo  cp -r ${SRC_DIR}/Kvantum/*                                                         ${KVANTUM_DIR}
sudo  cp -r ${SRC_DIR}/color-schemes/*                                                   ${SCHEMES_DIR}
sudo  cp -r ${SRC_DIR}/plasma/desktoptheme/${name}*                                      ${PLASMA_DIR}
sudo  cp -r ${SRC_DIR}/plasma/desktoptheme/icons                                         ${PLASMA_DIR}/${name}
sudo  cp -r ${SRC_DIR}/plasma/desktoptheme/icons                                         ${PLASMA_DIR}/${name}-dark
sudo  cp -r ${SRC_DIR}/plasma/look-and-feel/*                                            ${LOOKFEEL_DIR}
sudo  cp -r ${SRC_DIR}/plasma/plasmoids/*                                                ${PLASMOID_DIR}
sudo  cp -r ${SRC_DIR}/wallpaper/*                                                       ${WALLPAPER_DIR}
sudo  cp -r ${SRC_DIR}/icons/cursors/*                                                   ${Cusrsor_DIR}
sudo  cp -r ${SRC_DIR}/fonts/*                                                           ${fonts_DIR}
 # cp -r ${SRC_DIR}/fonts/NotoColorEmoji.ttf                                          ${EMOJIS_DIR}
  cp -r ${SRC_DIR}/confs/*                                                            ${CONF_DIR}
}

echo "Installing '${THEME_NAME} kde themes'..."

install "${name:-${THEME_NAME}}"
install_icons
install_gtk
install_sddm
sudo add-apt-repository ppa:papirus/papirus
sudo apt install libgtkmm-3.0-1v5 libcdio-paranoia2 qt5-style-kvantum qt5-style-kvantum-themes libgtk2.0-0 latte-dock apg apturl cheese-common gir1.2-totemplparser-1.0 gjs grilo-plugins-0.3-base gstreamer1.0-clutter-3.0 gstreamer1.0-pipewire libatkmm-1.6-1v5 libcairomm-1.0-1v5 libcheese-gtk25 libcheese8 libclutter-1.0-0 libclutter-1.0-common libclutter-gst-3.0-0 libclutter-gtk-1.0-0 libcogl-common libcogl-pango20 libcogl-path20 libcogl20 libcolord-gtk1 libcue2 libdazzle-1.0-0 libdazzle-common  libevdocument3-4 libevview3-3 libexempi8 libfreerdp-server2-2 libgjs0g libgnome-autoar-0-0 libgnome-games-support-1-3 libgnome-games-support-common  libgoa-backend-1.0-1 libgom-1.0-0 libgsf-1-114 libgsf-1-common libgsound0 libgtkmm-3.0-1v5 libgtop-2.0-11 libgtop2-common libgupnp-av-1.0-3 libgupnp-dlna-2.0-4 libgxps2 libkpathsea6 liblua5.3-0 libmalcontent-0-0 libmediaart-2.0-0  libpangomm-1.4-1v5 libphonenumber8 libqqwing2v5 libsynctex2 libsysmetrics1 libtracker-sparql-3.0-0 libvncserver1 libxkbregistry0 mutter-common nautilus-data network-manager-gnome p11-kit p11-kit-modules
cp -r ${SRC_DIR}/confs/*                                                            ${CONF_DIR}


echo "Install finished..."
