# golang toolchain install

{% set golang_version = '1.9' %}
{% set golang_linux_checksum = 'd70eadefce8e160638a9a6db97f7192d8463069ab33138893ad3bf31b0650a79' %}
{% set golang_osx_checksum = 'c2df361ec6c26fcf20d5569496182cb20728caa4d351bc430b2f0f1212cca3e0' %}
{% set golang_dl_base = 'https://storage.googleapis.com/golang/go' %}

install golang {{golang_version}}:
  archive.extracted:
    - name: /opt/go{{ golang_version }}
    {% if grains['os'] == 'MacOS' %}
    - source: {{ golang_dl_base }}{{ golang_version }}.darwin-amd64.tar.gz
    - source_hash: {{ golang_osx_checksum }}
    {% else %}
    - source: {{ golang_dl_base }}{{ golang_version }}.linux-amd64.tar.gz
    - source_hash: {{ golang_linux_checksum }}
    {% endif %}
    - trim_output: true

symlink golang:
  file.symlink:
    - name: /opt/go
    - target: /opt/go{{ golang_version }}/go

