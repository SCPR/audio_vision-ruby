require 'bundler/setup'
Bundler.require

SPEC_ROOT    = File.dirname(__FILE__)
FIXTURE_ROOT = File.join SPEC_ROOT, "fixtures"

# Require the support files
Dir["#{SPEC_ROOT}/support/**/*.rb"].each { |f| require f }

# Disallow real network connections
require 'webmock/rspec'
WebMock.disable_net_connect!


# Configuration
RSpec.configure do |config|
  config.include FakeResponse

  config.before do
    WebMock.reset!
  end
end
