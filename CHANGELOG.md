# Changelog

All notable changes to this project will be documented in this file.

## Release 1.1.0

2022-07-21

Backwards-incompatible release that updates the code for modern language conventions.

* Update for Puppet 4.x+ language conventions, including:
  * Parameter data types
  * Replace ERB template with EPP template
  * Use Hiera data in module for defaults

* Removes EL5 and EL6 from supported platforms. The default configs are still in the module - this just removes those versions
  from metadata.
* Removes ancient Ubuntu releases, adds current releases.
* Added RedHat 8 defaults [@bschonec](https://github.com/bschonec) [PR #6](https://github.com/joshbeard/puppet-login_defs/pull/6)
* Metadata syntax fix [@sdwatwork](https://github.com/sdwatwork) [PR #10](https://github.com/joshbeard/puppet-login_defs/pull/10)
* Added RedHat 9 defaults [@bschonec](https://github.com/bschonec) [PR #11](https://github.com/joshbeard/puppet-login_defs/pull/11)

* Modernized module with `pdk convert`
* Fixed, updated and added unit tests

## Release 0.2.0

2016-04-06

* Update for EL 7 defaults (PR #1)
