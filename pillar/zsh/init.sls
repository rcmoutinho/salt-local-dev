#!yaml

zsh:
  plugins:
    load:
      - git
      - salt
      - vagrant

    custom:
      - name: zsh-autosuggestions
        url: https://github.com/zsh-users/zsh-autosuggestions.git
        release: v0.7.0
      - name: zsh-syntax-highlighting
        url: https://github.com/zsh-users/zsh-syntax-highlighting.git
        release: 0.8.0
