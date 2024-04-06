# Class to manage the /etc/login.defs file on Linux systems
#
# @param mode
#   The desired permissions mode for the file. This is the 'mode' value for the
#   File resource.
#
# @param owner
#   The desired owner for the file. This is the 'owner' value for the File
#   resource.
#
# @param group
#   The desired group for the file. This is the 'group' value for the File
#   resource.
#
# @param options
#   Hash of key/value pairs to place in login.defs. The keys will be UPPERCASED
#   and should be strings. The values can be strings or integers.
#   These values will be merged with the 'default_options' specified by the
#   module. The options specified will take precedence.
#
# @param default_options
#   Default options for a platform.
#   These values will be merged with the 'options' specified by the user.
#
# @param common_options
#   Deprecated parameter. Internally used for setting common options for OS
#   families (RedHat). It is merged with 'default_options' and 'options'.
#
class login_defs (
  Pattern[/^\d{3,4}$/]                             $mode            = '0644',
  String                                           $owner           = 'root',
  String                                           $group           = '0',
  Hash[String, Variant[String, Integer]]           $options         = {},
  Hash[String, Variant[String, Integer]]           $default_options = {},
  Hash[String, Variant[String, Integer]]           $common_options  = {},
) {
  $_merged_options = merge($common_options, $default_options)
  $_config_options = merge($_merged_options, $options)

  # common_options is deprecated.
  if $common_options != {} {
    notify { 'common_options_deprecated':
      message  => join([
          'The `common_options` parameter is deprecated and will be removed in',
          'a future release. Please use `default_options` instead.',
      ], ' '),
      loglevel => 'warning',
    }
  }

  file { '/etc/login.defs':
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('login_defs/login.defs.epp', { 'config_options' => $_config_options }),
  }
}
