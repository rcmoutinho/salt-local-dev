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

  apps:
    - homebrew/cask/1password # https://formulae.brew.sh/cask/1password
    - homebrew/cask/adobe-acrobat-reader # https://formulae.brew.sh/cask/adobe-acrobat-reader
    - homebrew/cask/balenaetcher # https://formulae.brew.sh/cask/balenaetcher
    - homebrew/cask/camtasia # https://formulae.brew.sh/cask/camtasia
    - homebrew/cask/discord # https://formulae.brew.sh/cask/discord
    - homebrew/cask/divvy # https://formulae.brew.sh/cask/divvy
    - homebrew/cask/google-drive # https://formulae.brew.sh/cask/google-drive
    - homebrew/cask/imageoptim # https://formulae.brew.sh/cask/imageoptim
    - homebrew/cask/keka # https://formulae.brew.sh/cask/keka
    - homebrew/cask/notion # https://formulae.brew.sh/cask/notion
    - homebrew/cask/paragon-ntfs # https://formulae.brew.sh/cask/paragon-ntfs (NTFS for Mac)
    - homebrew/cask/postman # https://formulae.brew.sh/cask/postman
    - homebrew/cask/raspberry-pi-imager # https://formulae.brew.sh/cask/raspberry-pi-imager
    - homebrew/cask/spotify # https://formulae.brew.sh/cask/spotify
    - homebrew/cask/vlc # https://formulae.brew.sh/cask/vlc
    - homebrew/cask/vuescan # https://formulae.brew.sh/cask/vuescan
    - homebrew/cask/zoom # https://formulae.brew.sh/cask/zoom

  defaults:

    #################### Dock
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

    #################### Finder
    NSGlobalDomain:
      killall: Finder
      config:
        AppleShowAllExtensions: # Show all file extensions in the Finder
          type: -int
          value: 1
        NSTableViewDefaultSizeMode: # Choose the size of Finder sidebar icons
          type: -int
          value: 1

        ##### Keyboard
        # A restart of your Mac is required to apply these changes
        com.apple.keyboard.fnState: # Allows you to change the behavior of the function keys
          type: -int
          value: 1 # F1, F2, etc. behave as standard function keys. Press the fn key to use the special features printed on the key.

    # com.apple.universalaccess: # This command requires to grant full disk access to the terminal
    #   killall: Finder
    #   config:
    #     showWindowTitlebarIcons: # Always show folder icon before title in the title bar
    #       type: -int
    #       value: 1

    com.apple.finder:
      killall: Finder
      config:
        AppleShowAllFiles: # Show hidden files in the Finder (toggle the value using 'CMD+Shift+.')
          type: -int
          value: 1
        ShowPathbar: # Show path bar in the bottom of the Finder windows
          type: -int
          value: 1
        FXPreferredViewStyle: # Set the default view style for folders without custom setting
          type: -string
          value: Nlsv
        FXRemoveOldTrashItems: # Remove items in the bin after 30 days
          type: -int
          value: 1

    #################### Keyboard
    # A restart of your Mac is required to apply these changes
    com.apple.HIToolbox:
      config:
        AppleFnUsageType: # Choose what happens when you press the Fn or 🌐︎ key on the keyboard
          type: -int
          value: 2 # Opens the Character Viewer for entering emoji, symbols, and more.


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
        - /Applications/Notion.app
        - /Applications/WhatsApp.app
        - /System/Applications/System Settings.app
        - /System/Applications/Utilities/Terminal.app
        - /Applications/Visual Studio Code.app
        - /Applications/Brave Browser.app
        - /Applications/Spotify.app
        - /Applications/Microsoft Excel.app
      others:
        - ~/Downloads

    spacer:
      default:
        type: small-spacer # spacer|small-spacer|flex-spacer
        section: apps # apps | others
      list:
        - after: /System/Applications/System Settings.app
        - after: /Applications/Visual Studio Code.app
        - after: /Applications/Microsoft Excel.app
