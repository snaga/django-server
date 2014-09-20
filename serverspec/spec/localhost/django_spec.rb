require 'spec_helper'

describe package('python') do
  it { should be_installed }
end

describe package('python-devel') do
  it { should be_installed }
end

describe file('/usr/bin/pip') do
  it { should be_file }
  it { should be_mode 755 }
end

describe file('/etc/httpd/modules/mod_wsgi.so') do
  it { should be_file }
  it { should be_mode 755 }
end

describe file('/etc/httpd/conf/wsgi.conf') do
  it { should be_file }
  it { should be_mode 644 }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  its(:content) { should match /LoadModule wsgi_module modules\/mod_wsgi\.so/ }
  its(:content) { should match /Include conf\/wsgi\.conf/ }
end

describe command('pip list | fgrep -c "Django (1.6)"') do
  it { should return_stdout '1' }
end

describe command('fgrep -c mod_wsgi /var/log/httpd/error_log') do
  it { should_not return_stdout '0' }
end
