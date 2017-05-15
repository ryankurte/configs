# Apparmor cheatsheet

- Install: `sudo apt-get install apparmor apparmor-profiles apparmor-utils apparmor-profiles-extra auditd`
- Status: `sudo aa-status`
- Start profile logging: `sudo aa-complain [APP]`
- Check for profile changes: `sudo aa-logprof`
- Enable profile: `sudo aa-enable [APP]`
- Debug failures: `sudo systemctl status [APP]; sudo tail /var/log/syslog`

## Resources

- https://wiki.debian.org/AppArmor/HowToUse
- https://www.digitalocean.com/community/tutorials/how-to-create-an-apparmor-profile-for-nginx-on-ubuntu-14-04
