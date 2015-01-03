require 'spec_helper'
describe 'gsdesktop' do

  context 'with defaults for all parameters' do
    it { should contain_class('gsdesktop') }
  end
end
