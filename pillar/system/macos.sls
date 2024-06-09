#!yaml

macos:

  # Docs: https://github.com/mas-cli/mas
  # How to search for your app: `mas search <my-app-name>`
  mac_app_store:

    # NOTE: It will only consider apps already downloaded in the past
    # If you never downloaded, you will need to do it before trying this
    install: []
      # - 1333542190 # 1Password 7 - Password Manager

  defaults:
    com.apple.dock:
      killall: Dock
      config:
        tilesize:
          type: -int
          value: 45
        autohide:
          type: -int
          value: 0
        show-recents:
          type: -int
          value: 0
