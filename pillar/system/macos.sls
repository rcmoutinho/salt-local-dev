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
    NSGlobalDomain:
      killall: Finder
      config:
        AppleShowAllExtensions:
          type: -int
          value: 1
    com.apple.finder:
      killall: Finder
      config:
        AppleShowAllFiles:
          type: -int
          value: 1

  dock:
    remove_default:
      - Safari
      - Messages
      - Mail
      - Maps
      - Photos
      - FaceTime
      - Contacts
      - TV
      - Music
      - Podcasts
      - News

    # define order via /Users/<user>/Library/Preferences/com.apple.dock.plist
    define:
      apps:
        # Finder (/System/Library/CoreServices/Finder.app)
        - /System/Applications/Launchpad.app
        - /System/Applications/App Store.app
        - /System/Applications/Calendar.app
        - /System/Applications/Reminders.app
        - /System/Applications/Notes.app
        - /System/Applications/System Preferences.app
        - /System/Applications/Utilities/Terminal.app
        - /Applications/Visual Studio Code.app
        - /Applications/Google Chrome.app
      others:
        - ~/Downloads

    spacer:
      default:
        type: small-spacer # spacer|small-spacer|flex-spacer
        section: apps # apps | others
      list:
        - after: /System/Applications/System Preferences.app
        - after: /Applications/Visual Studio Code.app

