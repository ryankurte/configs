
allow-salt-master-4505:
  iptables.insert:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - position: 5
    - match: state
    - connstate: NEW
    - dport: 4505
    - proto: tcp
    - sport: 1025:65535
    - save: True

allow-salt-master-4506:
  iptables.insert:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - position: 6
    - match: state
    - connstate: NEW
    - dport: 4506
    - proto: tcp
    - sport: 1025:65535
    - save: True

