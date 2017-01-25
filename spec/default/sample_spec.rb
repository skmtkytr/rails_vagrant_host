require 'spec_helper'

# vagrantとしてログイン
describe command('whoami'), if: os[:family] == 'redhat' do
  its(:stdout) { should match(/vagrant/) }
end

# Ruby のバージョンが2.3.3であること
describe command('/home/vagrant/.rbenv/bin/rbenv version'), if: os[:family] == 'redhat' do
  its(:stdout) { should match(/2.3.3/) }
end

# bundler がインストールされていること
describe command('/home/vagrant/.rbenv/shims/gem list'), if: os[:family] == 'redhat' do
  its(:stdout) { should match(/bundler/) }
end

# git がインストールされていること
describe package('git'), if: os[:family] == 'redhat' do
  it { should be_installed }
end

# Node.js がインストールされていること
describe package('nodejs'), if: os[:family] == 'redhat' do
  it { should be_installed }
end

# Nginx がインストールされていること
describe package('nginx'), if: os[:family] == 'redhat' do
  it { should be_installed }
end

# Nginx が起動していること
describe service('nginx'), if: os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

# ポートが開いていること
describe port(80), if: os[:family] == 'redhat' do
  it { should be_listening }
end
