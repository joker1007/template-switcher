ENV["RAILS_ENV"] = "test"

$:.unshift File.dirname(__FILE__)

require "rails_app/config/environment"

I18n.load_path << File.expand_path("../support/locale/en.yml", __FILE__)

require "rspec/rails"

RSpec::configure do |c|
  def c.escaped_path(*parts)
    Regexp.compile(parts.join('[\\\/]') + '[\\\/]')
  end

  c.include RSpec::Rails::ControllerExampleGroup, :type => :controller, :example_group => {
    :file_path => c.escaped_path(%w[spec controllers])
  }
end
