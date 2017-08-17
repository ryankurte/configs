# Install ZSH
# Requires user argument set in pillar
# Run locally with `sudo salt-call --local state.apply states/zsh pillar='{"user":"ryan"}'

Install zsh:
  pkg.installed:
    - pkgs:
      - zsh

Install oh-my-zsh:
  cmd.script:
    - source: https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh 
    - source_hash: dc5b7335c6f8c0e6282bb160c26bc2f175e197051d3e98c05d7823dfaf859c7e0ae12778fd739013c810e799bb0525e55f26bb030b71b904ce5b8e04
    - runas: {{ pillar['user'] }}


