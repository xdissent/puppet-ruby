require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
end

def default_test_facts
  {
    :boxen_home                  => "/test/boxen",
    :boxen_user                  => "testuser",
    :boxen_s3_host               => "s3.amazonaws.com",
    :boxen_s3_bucket             => "boxen-downloads",
    :macosx_productversion_major => "10.8",
    :osfamily                    => "Darwin",
  }
end
