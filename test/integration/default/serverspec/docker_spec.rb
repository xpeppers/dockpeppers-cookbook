require 'spec_helper'

describe 'boxpeppers::docker' do
  describe 'docker is installed' do
    describe command('docker -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe service('docker') do
    it { should be_enabled  }
    it { should be_running  }
  end
end
