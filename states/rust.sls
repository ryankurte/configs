# Install Rustup
# Requires user argument set in pillar
# Run locally with `sudo salt-call --local state.apply states/zsh pillar='{"user":"ryan"}'

Install rustup:
  cmd.script:
    - name: "rustup-init.sh -v -y"
    - source: https://static.rust-lang.org/rustup/rustup-init.sh
    - source_hash: b8d5555124bc8fc47557f375e194ab5513daf6531dbcb499fe89c91256aa26abc51a0e24db3e75541739aad708faa64cfd7744c88724e9f62a7f73b65fc4c2db
    - runas: {{ pillar['user'] }}

Setup env:
  cmd.run:
    - name: source ~/.cargo/env
    - runas: {{ pillar['user'] }}

Install nightly:
  cmd.run:
    - name: rustup install nightly
    - runas: {{ pillar['user'] }}


