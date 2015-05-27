require 'spec_helper'

describe 'boxpeppers::docker' do
  describe package('git') do
    it { should be_installed }
  end

  describe 'docker is installed' do
    describe command('docker -v') do
      its(:exit_status) { should eq 0 }
    end

    describe service('docker') do
      it { should be_enabled  }
      it { should be_running  }
    end
  end

  describe 'docker-compose is installed' do
    describe command('docker-compose --version') do
      its(:exit_status) { should eq 0 }
    end
  end
end
