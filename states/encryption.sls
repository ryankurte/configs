# Encrypt user home partition

Install ecryptfs:
  pkg.installed:
    - pkgs:
      - ecryptfs-utils

Load module:
  kmod.present:
    - name: ecryptfs
    - persist: true



