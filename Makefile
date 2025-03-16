COLLECTION_MANAGER_VERSION := 0.1.1
DEVELOPER_VERSION := 0.5.0
DREAMCAST_EMULATOR_VERSION := 0.3.4
DROPBEAR_SSH_VERSION := 0.5.0
DUFS_SERVER_VERSION := 0.5.5
FILEBROWSER_VERSION := 0.5.2
FN_EDITOR_VERSION := 0.3.4
MOONLIGHT_VERSION := 0.3.3
N64_EMULATOR_VERSION := 0.2.1
RANDOM_GAME_VERSION := 0.3.1
REMOTE_TERMINAL_VERSION := 0.5.2
REPORT_VERSION := 0.6.1
SCREENSHOT_MONITOR_VERSION := 0.5.0
SFTPGO_VERSION := 0.3.1
SYNCTHING_VERSION := 0.3.0
TERMINAL_VERSION := 0.6.2
USB_MASS_STORAGE_VERSION := 0.3.1
WIFI_VERSION := 0.10.1


FOLDER_NAME ?= "MinUI"
ZIP_NAME ?= "MinUI.zip"

.PHONY: build
build: emus tools
	zip -r $(ZIP_NAME) $(FOLDER_NAME)

emus:
	$(MAKE) dreamcast-emulator
	$(MAKE) n64-emulator

dreamcast-emulator:
	$(MAKE) install-pak PAK_TYPE="Emus" PAK_URL="https://github.com/josegonzalez/minui-dreamcast-pak/releases/download/$(DREAMCAST_EMULATOR_VERSION)/DC.pak.zip" PAK_NAME="DC"

n64-emulator:
	$(MAKE) install-pak PAK_TYPE="Emus" PAK_URL="https://github.com/josegonzalez/minui-n64-pak/releases/download/$(N64_EMULATOR_VERSION)/N64.pak.zip" PAK_NAME="N64"

tools:
	$(MAKE) collection-manager
	$(MAKE) developer
	$(MAKE) dropbear-ssh
	$(MAKE) dufs-server
	$(MAKE) filebrowser
	$(MAKE) fn-editor
	$(MAKE) moonlight
	$(MAKE) random-game
	$(MAKE) report
	$(MAKE) screenshot-monitor
	$(MAKE) sftpgo
	$(MAKE) syncthing
	$(MAKE) wifi
	$(MAKE) usb-mass-storage

collection-manager:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/jiserra/Collection-Manager.pak/releases/download/$(COLLECTION_MANAGER_VERSION)/Collection.Manager.pak.zip" PAK_NAME="Collection Manager"

developer:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-developer-pak/releases/download/$(DEVELOPER_VERSION)/Developer.pak.zip" PAK_NAME="Developer"

dropbear-ssh:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-dropbear-server-pak/releases/download/$(DROPBEAR_SSH_VERSION)/SSH.Server.pak.zip" PAK_NAME="SSH Server"

dufs-server:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-dufs-server-pak/releases/download/$(DUFS_SERVER_VERSION)/HTTP.Server.pak.zip" PAK_NAME="HTTP Server"
	
filebrowser:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-filebrowser-pak/releases/download/$(FILEBROWSER_VERSION)/HTTP.Filebrowser.pak.zip" PAK_NAME="HTTP Filebrowser"

fn-editor:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/trimui-brick-fn-editor-pak/releases/download/$(FN_EDITOR_VERSION)/FN.Editor.pak.zip" PAK_NAME="FN Editor"

moonlight:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/trimui-brick-moonlight-pak/releases/download/$(MOONLIGHT_VERSION)/Moonlight.pak.zip" PAK_NAME="Moonlight"

random-game:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-random-game-pak/releases/download/$(RANDOM_GAME_VERSION)/Random.Game.pak.zip" PAK_NAME="Random Game"

remote-terminal:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-remote-terminal-pak/releases/download/$(REMOTE_TERMINAL_VERSION)/Remote.Terminal.pak.zip" PAK_NAME="Remote Terminal"

report:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-report-pak/releases/download/$(REPORT_VERSION)/Report.pak.zip" PAK_NAME="Report"

screenshot-monitor:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-screenshot-monitor-pak/releases/download/$(SCREENSHOT_MONITOR_VERSION)/Screenshot.Monitor.pak.zip" PAK_NAME="Screenshot Monitor"

sftpgo:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-sftpgo-server-pak/releases/download/$(SFTPGO_VERSION)/FTP.Server.pak.zip" PAK_NAME="FTP Server"

syncthing:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-syncthing-pak/releases/download/$(SYNCTHING_VERSION)/Syncthing.pak.zip" PAK_NAME="Syncthing"

terminal:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-terminal-pak/releases/download/$(TERMINAL_VERSION)/Terminal.pak.zip" PAK_NAME="Terminal"

wifi:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/minui-wifi-pak/releases/download/$(WIFI_VERSION)/Wifi.pak.zip" PAK_NAME="Wifi"

usb-mass-storage:
	$(MAKE) install-pak PAK_TYPE="Tools" PAK_URL="https://github.com/josegonzalez/trimui-brick-usb-mass-storage-pak/releases/download/$(USB_MASS_STORAGE_VERSION)/USB.Mass.Storage.pak.zip" PAK_NAME="USB Mass Storage"

install-pak:
ifndef PAK_NAME
	$(error PAK_NAME is not set)
endif
ifndef PAK_TYPE
	$(error PAK_TYPE is not set)
endif
ifndef PAK_URL
	$(error PAK_URL is not set)
endif
	mkdir -p .tmp
	curl -o ".tmp/$(PAK_NAME).zip" -sSL "$(PAK_URL)"
	mkdir -p "$(FOLDER_NAME)/$(PAK_TYPE)"
	unzip -q -o ".tmp/$(PAK_NAME).zip" -d ".tmp/$(PAK_NAME).pak"
	for platform in $$(jq -rM '.platforms[]' ".tmp/$(PAK_NAME).pak/config.json"); do \
		mkdir -p "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform"; \
		rm -rf "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform/$(PAK_NAME).pak"; \
		cp -r ".tmp/$(PAK_NAME).pak" "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform/$(PAK_NAME).pak"; \
	done
	rm -rf .tmp
