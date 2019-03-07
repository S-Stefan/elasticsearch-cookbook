# # encoding: utf-8

# Inspec test for recipe elasticsearch::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package("openjdk-8-jdk") do
  it { should be_installed }
end

describe package("apt-transport-https") do
  it { should be_installed }
end

describe package("elasticsearch") do
  it { should be_installed }
  its('version') { should match /5.6.15\./ }
end
