# gentoo-overlay


 * https://wiki.gentoo.org/wiki/Overlay/Local_overlay


Add an entry to /etc/portage/repos.conf:

[masterzorag]
## set this to any location you want
location = /usr/local/portage
sync-uri = https://github.com/masterzorag/gentoo-overlay.git
sync-type = git
auto-sync = yes
