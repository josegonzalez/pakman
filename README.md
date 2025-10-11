# pakman

An automatically generated collection of paks for your MinUI installation

## Supported Devices

These set of paks are designed and tested on the following MinUI Platforms and devices:

- `miyoomini`: Miyoo Mini Plus and the Miyoo Mini
- `my282`: Miyoo A30
- `my355`: Miyoo Flip
- `rg35xxplus`: RG-35XX Plus, RG-34XX, RG-35XX H, RG-35XX SP
- `tg5040`: Trimui Brick (formerly `tg3040`), Trimui Smart Pro

Note that certain paks _may_ not be supported on specific platforms; Emu paks are generally platform specific.

## Installation

> [!IMPORTANT]
> MinUI must have already been installed and booted at least once on your device. Please follow these steps after installing MinUI.

1. Mount your MinUI SD card.
2. Download the latest release from the [Github releases page](https://github.com/josegonzalez/pakman/releases). It will be named either `Pakman-minui.zip` or `Pakman-nextui.zip`.
3. Unzip the `Pakman.zip` file and browse to the newly created `Pakman` folder.
4. From within the `Pakman` folder, copy the `Emus`, `Roms`, and `Tools` directories onto your SD Card. When prompted, _merge_ the files into place.
5. Confirm that your SD Card now has an `Emus/tg5040/N64.pak/launch.sh` file and a `Tools/tg5040/Developer.pak/launch.sh` file. If these do not exist, the paks were not installed properly. Please file an issue if so.
6. Delete the `Pakman` folder and `Pakman.zip` file
7. Unmount your SD Card and insert it into your MinUI device.

## Usage

See the readme for each pak. Note that certain paks _may_ not be supported on specific platforms; Emu paks are generally platform specific.

## Credits

Below are the paks sourced by this pak collection. Please refer to the licenses for each pak for more details on licensing.

### Emu Paks

<!-- begin emu paks -->

- [Dreamcast](https://github.com/josegonzalez/minui-dreamcast-pak) by @josegonzalez
- [NDS](https://github.com/josegonzalez/minui-nintendo-ds-pak) by @josegonzalez
- [N64](https://github.com/josegonzalez/minui-n64-pak) by @josegonzalez
- [Pico-8](https://github.com/josegonzalez/minui-pico-8-pak) by @josegonzalez
- [Portmaster](https://github.com/ben16w/minui-portmaster) by @ben16w
- [PSP](https://github.com/ben16w/minui-psp) by @ben16w

<!-- end emu paks -->

### Tool Paks

<!-- begin tool paks -->

- [Artwork Scraper](https://github.com/josegonzalez/minui-artwork-scraper-pak) by @josegonzalez
- [Cloud Backups](https://github.com/ben16w/minui-cloud-backups) by @ben16w
- [Collection Manager](https://github.com/jiserra/Collection-Manager.pak) by @jiserra
- [Developer](https://github.com/josegonzalez/minui-developer-pak) by @josegonzalez
- [Dropbear SSH Server](https://github.com/josegonzalez/minui-dropbear-server-pak) by @josegonzalez
- [Dufs HTTP Server](https://github.com/josegonzalez/minui-dufs-server-pak) by @josegonzalez
- [Favorites](https://github.com/ben16w/minui-favorites) by @ben16w
- [FTP Server](https://github.com/josegonzalez/minui-ftpserver-pak) by @josegonzalez
- [Gallery](https://github.com/josegonzalez/minui-gallery-pak) by @josegonzalez
- [Media Player](https://github.com/josegonzalez/trimui-brick-media-player-pak) by @josegonzalez
- [Moonlight](https://github.com/josegonzalez/trimui-brick-moonlight-pak) by @josegonzalez
- [M3U Manager](https://github.com/josegonzalez/minui-m3u-manager-pak) by @josegonzalez
- [Map.txt Generator](https://github.com/josegonzalez/minui-map-txt-generator-pak) by @josegonzalez
- [Mortar](https://github.com/UncleJunVIP/Mortar.pak) by @UncleJunVIP
- [Random Game](https://github.com/josegonzalez/minui-random-game-pak) by @josegonzalez
- [Remote Terminal](https://github.com/josegonzalez/minui-remote-terminal-pak) by @josegonzalez
- [Report](https://github.com/josegonzalez/minui-report-pak) by @josegonzalez
- [Search](https://github.com/laesetuc/minui-search-pak) by @laesetuc
- [Screenshot Monitor](https://github.com/josegonzalez/minui-screenshot-monitor-pak) by @josegonzalez
- [Simple Mode](https://github.com/josegonzalez/minui-simple-mode-pak) by @josegonzalez
- [Syncthing](https://github.com/josegonzalez/minui-syncthing-pak) by @josegonzalez
- [Tailscale](https://github.com/ben16w/minui-tailscale) by @ben16w
- [Terminal](https://github.com/josegonzalez/minui-terminal-pak) by @josegonzalez

#### MinUI Only

- [Fn Editor](https://github.com/josegonzalez/trimui-brick-fn-editor-pak) by @josegonzalez
- [Usb Mass Storage](https://github.com/josegonzalez/trimui-brick-usb-mass-storage-pak) by @josegonzalez
- [Wifi](https://github.com/josegonzalez/minui-wifi-pak) by @josegonzalez

#### NextUI Only

- [Game Manager](https://github.com/UncleJunVIP/nextui-game-manager) by @UncleJunVIP
- [Theme Manager](https://github.com/Leviathanium/NextUI-Theme-Manager) by @Leviathanium
- [Pak Store](https://github.com/UncleJunVIP/nextui-pak-store) by @UncleJunVIP
- [OTA Updater](https://github.com/LanderN/nextui-updater-pak) by @LanderN

<!-- end tool paks -->
