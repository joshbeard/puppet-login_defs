require 'spec_helper'
require 'spec_helper_local'

describe 'login_defs' do
  TEST_MATRIX.each do |platform, params|
    file = CONF_HEADER
    context "with default parameters on #{platform}" do
      let(:facts) do
        params['facts']
      end

      it { is_expected.to contain_class('login_defs') }

      # Build a string of the file contents to compare
      params['options'].sort.each { |k, v| file += "#{k} #{v}\n" }

      it { is_expected.to contain_file('/etc/login.defs').with_content(file) }

      it { is_expected.not_to contain_notify('common_options_deprecated') }
    end
  end

  context 'with deprecated common_options parameter' do
    let(:facts) do
      {
        osfamily: 'RedHat',
        operatingsystem: 'RedHat',
        operatingsystemrelease: '7.0',
        operatingsystemmajrelease: '7',
        architecture: 'x86_64',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin',
        kernel: 'Linux',
        selinux: true,
        is_virtual: false
      }
    end
    let(:params) do
      {
        common_options: {
          'UMASK' => '077',
        }
      }
    end

    it { is_expected.to contain_file('/etc/login.defs').with_content(CONF_HEADER + "UMASK 077\n") }

    it { is_expected.to contain_notify('common_options_deprecated') }
  end
end
