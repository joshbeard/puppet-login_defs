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
#   Internally used to list default options for a platform.
#   These values will be merged with the 'options' specified by the user.
#
# @param common_options
#   Internally used for setting common options for OS families (RedHat). It is
#   merged with 'default_options' and 'options'.
#
class login_defs (
  Pattern[/^\d{3,4}$/]                             $mode            = '0644',
  String                                           $owner           = 'root',
  String                                           $group           = '0',
  Optional[Hash[String, Variant[String, Integer]]] $options         = {},
  Hash[String, Variant[String, Integer]]           $default_options = {},
) {

  $_config_options = merge($default_options, $options)

  file { '/etc/login.defs':
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('login_defs/login.defs.epp', {'config_options' => $_config_options}),
  }

}
