# Zsh <!-- omit in toc -->

- [About](#about)
- [FAQ](#faq)
  - [How to get all the features of P10k on all users?](#how-to-get-all-the-features-of-p10k-on-all-users)
- [References](#references)

## About

It will install the [Zsh](https://www.zsh.org/) shell and [Oh My Zsh](https://ohmyz.sh/) framework to improve its usability and power.

## FAQ

### How to get all the features of P10k on all users?

The simple answer is to install and configure ZSH and p10k on each user. So far, this project will only be done on the primary user _(based on personal pillars)_.

Another quick option is using `sudo -E zsh` instead of `su root`, where `-E` preserves the environment, the most relevant in this case, HOME. You might get a warning message that you should follow the instructions and/or check this [GitHub issue](https://github.com/romkatv/powerlevel10k/issues/1953) to learn more about it.

## References

- Themes
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Articles
  - [Oh My Zsh + PowerLevel10k = 😎 terminal](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)
