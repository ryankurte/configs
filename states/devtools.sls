# Development tool install and config

{% if grains['os'] == 'Debian' and grains['cpuarch'] == 'x86_64' %}
Enable Multiarch for i386:
  cmd.run:
    - name: dpkg --add-architecture i386
    - unless: dpkg --print-foreign-architectures | grep 'i386'

Install multiarch packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - libstdc++6:i386 
      - libgcc1:i386 
      - zlib1g:i386 
      - libncurses5:i386
{% endif %}


Install development tools:
  pkg.installed:
    - pkgs:
      - git
      - subversion
      - build-essential
      - clang
      - cmake
      - make
      - automake
      - ninja-build
      - python-dev
      - python-setuptools
      - software-properties-common
      - python3-software-properties
      - ccache


