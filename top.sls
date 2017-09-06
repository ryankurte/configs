base:
  '*':
    - states/ssh
    - states/firewall

  'salt-*':
    - states/salt-master

  'rpi-*':
    - states/devtools
    - states/golang
    - states/python

  'dev-*':
    - states/devtools
    - states/golang
    - states/python

