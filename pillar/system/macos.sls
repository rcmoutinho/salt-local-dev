#!yaml

macos:

  # Docs: https://github.com/mas-cli/mas
  # How to search for your app: `mas search <my-app-name>`
  mac_app_store:

    # NOTE: It will only consider apps already downloaded in the past
    # If you never downloaded, you will need to do it before trying this
    install:
      - 1339170533 # CleanMyMac X
      - 302584613  # Kindle
      - 905953485  # NordVPN - VPN for privacy
      - 1289583905 # Pixelmator Pro
      - 425424353  # The Unarchiver

      # Messengers
      - 310633997  # WhatsApp Messenger
      - 747648890  # Telegram

      # Office 365 / Microsoft
      - 823766827  # OneDrive
      - 462054704  # Microsoft Word
      - 462058435  # Microsoft Excel
      - 1295203466 # Microsoft Remote Desktop

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
