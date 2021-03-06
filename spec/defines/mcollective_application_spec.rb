require 'spec_helper'

describe 'mcollective::application' do
  let (:title) { 'foo' }
  let (:facts) { {
    :osfamily => 'RedHat',
    :operatingsystem => 'RedHat',
  } }

  context 'when no source is passed' do
    it { should contain_file('/usr/libexec/mcollective/mcollective/application/foo.rb').with(
      :ensure => :present,
      :source => 'puppet:///modules/mcollective/application/foo.rb'
      ) }
  end

  context 'when source is passed' do
    let (:params) { {
      :source => '/tmp/foo.rb'
    } }

    it { should contain_file('/usr/libexec/mcollective/mcollective/application/foo.rb').with(
      :ensure => :present,
      :source => '/tmp/foo.rb'
    ) }
  end

  context 'when absent' do
    let (:params) { {
      :ensure => 'absent'
    } }

    it { should contain_file('/usr/libexec/mcollective/mcollective/application/foo.rb').with(
      :ensure => :absent
    ) }
  end
end
