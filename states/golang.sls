# golang toolchain install

{% set golang_version = '1.8.3' %}

install golang:
  file.managed:
    {% if grains['os'] == 'MacOS' %}
    - source: https://storage.googleapis.com/golang/go{{ golang_version }}.darwin-amd64.tar.gz
    - source_hash: f20b92bc7d4ab22aa18270087c478a74463bd64a893a94264434a38a4b167c05
    {% else %}
    - source: https://storage.googleapis.com/golang/go{{ golang_version }}.linux-amd64.tar.gz
    - source_hash: 1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772
    {% endif %}
    - name: /opt/go{{ golang_version }}.tar.gz

extract golang:
  archive.extracted:
    - name: /opt/go{{ golang_version }}
    - source: /opt/go{{ golang_version }}.tar.gz
    - trim_output: true

symlink golang:
  file.symlink:
    - name: /opt/go
    - target: /opt/go{{ golang_version }}/go


