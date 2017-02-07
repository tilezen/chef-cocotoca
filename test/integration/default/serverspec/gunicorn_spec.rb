require 'serverspec'

set :backend, :exec

describe "Gunicorn" do
  it "is listening on 8080 by default" do
    expect(port(8080)).to be_listening
  end

  it "has a running instance of gunicorn/cocotoca" do
    expect(service("cocotoca")).to be_running
  end
end

describe file("/var/log/cocotoca/current") do
  it { should exist }
  it { should be_readable }
  its(:content) { should match /Listening at: http:\/\/0.0.0.0:8080/ }
end
