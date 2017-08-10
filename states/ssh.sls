# SSHD Hardening

Install fail2ban:
  pkg.installed:
    - name: fail2ban

Disable password authentication:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: "(#){0,1}(PasswordAuthentication) (yes|no)"
    - repl: "PasswordAuthentication no"

