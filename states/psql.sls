# PostgreSQL Install and config

install postgres:
  pkg.installed:
    - name: postgresql

  service.running:
    - name: postgresql
    - enable: True
