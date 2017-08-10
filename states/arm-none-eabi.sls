# gcc-arm-none-eabi toolchain install

{% set gcc_version = 'gcc-arm-none-eabi-6-2017-q2-update' %}
{% set gcc_release = '6-2017q2' %}

install gcc-arm-none-eabi:
  file.managed:
    {% if grains['os'] == 'OSX' %}
    - source: https://developer.arm.com/-/media/Files/downloads/gnu-rm/{{ gcc_release }}/{{ gcc_version }}-mac.tar.bz2
    - source_hash: d536d7fb167c04b24f7f0d40cd739cac
    {% else %}
    - source: https://developer.arm.com/-/media/Files/downloads/gnu-rm/{{ gcc_release}}/{{ gcc_version }}-linux.tar.bz2
    - source_hash: 13747255194398ee08b3ba42e40e9465
    {% endif %}
    - name: /opt/{{ gcc_version }}.tar.bz2

extract gcc-arm-none-eabi:
  archive.extracted:
    - name: /opt/
    - source: /opt/{{ gcc_version }}.tar.bz2
    - trim_output: true

symlink gcc-arm-none-eabi:
  file.symlink:
    - name: /opt/gcc-arm-none-eabi
    - target: /opt/{{ gcc_version }}


