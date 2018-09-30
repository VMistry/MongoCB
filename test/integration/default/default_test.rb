# # encoding: utf-8

# Inspec test for recipe nginxCB::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service ("nginx") do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

describe http("http://localhost", enable_remote_worker: true) do
  its('status') {should cmp 502}
end
