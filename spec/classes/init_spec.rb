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
    end
  end
end
