# IPTables base config
# Chain based on http://www.alexlinux.com/salt-stack-iptables-example/

install iptables:
  pkg.installed:
    - name: iptables
    - name: iptables-persistent  

allow-established:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - source: '0.0.0.0/0'
    - proto: all
    - save: True

allow-localhost:
  iptables.append:
    - table: filter
    - chain: INPUT
    - in-interface: lo
    - jump: ACCEPT
    - save: True

allow-ssh:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 22
    - proto: tcp
    - sport: 1025:65535
    - save: True

deny-log:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: LOG
    - log-prefix: "iptables-dropped: "
    - log-level: 4
    - match: limit
    - limit: 2/min
    - source: '0.0.0.0/0'
    - destination: '0.0.0.0/0'

default-deny:
  iptables.set_policy:
     - table: filter
     - chain: INPUT
     - policy: DROP


