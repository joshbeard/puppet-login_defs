# login_defs module for Puppet

![Validation Status](https://github.com/joshbeard/puppet-login_defs/actions/workflows/validate.yml/badge.svg)
[![Puppet Forge](https://img.shields.io/puppetforge/v/joshbeard/login_defs.svg)](https://forge.puppetlabs.com/joshbeard/login_defs)
[![License](https://img.shields.io/github/license/joshbeard/puppet-login_defs.svg)](https://github.com/joshbeard/puppet-login_defs/blob/master/LICENSE)

Manages `/etc/login.defs` on Linux systems.

## Setup

### What this module affects

* Manages the contents, owner, group, and mode of `/etc/login.defs`

### Beginning with this module

A regular `include` will use default configuration:

```puppet
include login_defs
```

See [Example Usage](#example-usage) below for more ways to use this module.

## Requirements

* Requires Puppet 4.x
* Requires [puppetlabs/stdlib](https://forge.puppet.com/modules/puppetlabs/stdlib) module.

## Usage

### Class: `login_defs`

#### Parameters

##### `mode`

Specifies the file mode for `/etc/login.defs`.  Defaults to `0644`.

##### `owner`

Specifies the file owner for `/etc/login.defs`. Defaults to `root`.

##### `group`

Specifies the file group for `/etc/login.defs`. Defaults to `0`.

##### `options`

A _hash_ of options to populate the `login.defs` file with.

Reference the `login.defs(5)` man page for a list of configuration items and
their description.  [http://linux.die.net/man/5/login.defs](http://linux.die.net/man/5/login.defs)

* Any option you add here will be _merged_ with the default options.

* You can override a default value here as well by using a key with the same
  name.

* You can remove a default option by specifying `undef` or an empty string for
  its value.

* Your options will _not_ be validated for correctness.

### Example Usage

To customize, set the `login_defs::options` parameter with values that will
_override_ and be _merged_ with the defaults.

Specifying options in a class declaration:

```puppet
class { 'login_defs':
  options => {
    'UMASK' => '022'
  }
}
```

In Hiera data:

```yaml
login_defs::options:
  UMASK: '022'
```

Remove the default `ENCRYPT_METHOD` entirely:

```puppet
class { '::login_defs':
  options => {
    'ENCRYPT_METHOD' => undef,
  },
}
```

## Contributing

1. Fork and clone the repository.

2. Branch off of `master`.

3. Open a merge request into `master` and check the validation results (GitHub Actions).

To add a distribution's default options:

1. Create a file under `data/` named as:

   ```yaml
   - "%{facts.os.family}-%{facts.os.release.major}.yaml"
   - "%{facts.os.family}.yaml"
   - "%{facts.os.name}.yaml"
   ```

   Be specific if the options are unique to a particular release. Refer to the
   [RedHat defaults](data/) for an example of setting common defaults in
   `RedHat.yaml` and overriding or adding parameters in `RedHat-*.yml`.

2. Refer to the existing configs for an example of the structure.

3. Set _all_ of the default options for the distribution from `/etc/login.defs`
   without any customizations.

4. Define a test (optional)

   Add the test to the [`spec/matrix.yaml`](spec/matrix.yaml) file,
   specifying the value of the options to check. This may be duplicated from
   the Hiera data, but it's _flat_.

   A test isn't required for contributions, but it's helpful. If one isn't
   provided in a contribution, it will be added by the maintainer.

## Contributors

Maintained by [Josh Beard](https://joshbeard.me)

<a href="https://github.com/joshbeard/puppet-login_defs/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=joshbeard/puppet-login_defs" />
</a>

_Made with [contributors-img](https://contrib.rocks)._
