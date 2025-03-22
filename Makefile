FOLDER_NAME ?= "Pakman"
ZIP_NAME ?= "Pakman.zip"
PAK_JSON_FILE ?= "paks.json"

.PHONY: build
build: emus tools
	zip -r $(ZIP_NAME) $(FOLDER_NAME)

emus:
	@jq -c '.emu_paks[]' $(PAK_JSON_FILE) | while read -r pak; do \
		name=$$(echo $$pak | jq -r '.name'); \
		repository=$$(echo $$pak | jq -r '.repository'); \
		version=$$(echo $$pak | jq -r '.version'); \
		pak_name=$$(echo $$pak | jq -r '.pak_name'); \
		rom_folder=$$(echo $$pak | jq -r '.rom_folder'); \
		$(MAKE) install-pak PAK_TYPE="Emus" PAK_URL="$$repository/releases/download/$$version/$$pak_name.pak.zip" PAK_NAME="$$pak_name" || exit 1; \
		mkdir -p "$(FOLDER_NAME)/$$rom_folder"; \
		touch "$(FOLDER_NAME)/$$rom_folder/.keep"; \
	done

tools:
	@jq -c '.tool_paks[]' $(PAK_JSON_FILE) | while read -r pak; do \
		name=$$(echo $$pak | jq -r '.name'); \
		repository=$$(echo $$pak | jq -r '.repository'); \
		version=$$(echo $$pak | jq -r '.version'); \
		pak_name=$$(echo $$pak | jq -r '.pak_name'); \
		pak_zip_file=$$(echo $$pak | jq -r '.pak_name' | tr " " .); \
		$(MAKE) install-pak PAK_NAME="$$pak_name" PAK_TYPE="Tools" PAK_URL="$$repository/releases/download/$$version/$$pak_zip_file.pak.zip" || exit 1; \
	done

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
	curl -f -o ".tmp/$(PAK_NAME).zip" -sSL "$(PAK_URL)"
	mkdir -p "$(FOLDER_NAME)/$(PAK_TYPE)"
	unzip -q -o ".tmp/$(PAK_NAME).zip" -d ".tmp/$(PAK_NAME).pak"
	for platform in $$(jq -rM '.platforms[]' ".tmp/$(PAK_NAME).pak/config.json"); do \
		mkdir -p "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform"; \
		rm -rf "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform/$(PAK_NAME).pak"; \
		cp -r ".tmp/$(PAK_NAME).pak" "$(FOLDER_NAME)/$(PAK_TYPE)/$$platform/$(PAK_NAME).pak"; \
	done
	rm -rf .tmp

update: update-emus update-tools

update-emus:
	@jq -c '.emu_paks[]' $(PAK_JSON_FILE) | while read -r pak; do \
		pak_name=$$(echo $$pak | jq -r '.pak_name'); \
		$(MAKE) update-pak PAK_NAME="$$pak_name" PAK_TYPE="Emu"; \
	done

update-tools:
	@jq -c '.tool_paks[]' $(PAK_JSON_FILE) | while read -r pak; do \
		pak_name=$$(echo $$pak | jq -r '.pak_name'); \
		$(MAKE) update-pak PAK_NAME="$$pak_name" PAK_TYPE="Tool"; \
	done

update-pak:
ifndef PAK_NAME
	$(error PAK_NAME is not set)
endif
ifndef PAK_TYPE
	$(error PAK_TYPE is not set)
endif
	@chmod +x bin/update-pak
	@bin/update-pak "$(PAK_NAME)" "$(PAK_TYPE)"
