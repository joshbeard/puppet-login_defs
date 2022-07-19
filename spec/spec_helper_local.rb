require 'yaml'

TEST_MATRIX = YAML.load_file('./spec/matrix.yaml').fetch('test_matrix')

conf_header = <<-EOT
#
# HEADER: This file is managed by Puppet
# HEADER: Do not make modifications directly!
#
###############################################################################
#
# /etc/login.defs - Configuration control definitions for the login package.
#
EOT
CONF_HEADER = conf_header
