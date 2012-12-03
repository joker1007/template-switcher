module TemplateSwitcher
  class << self
    def mapping
      @mapping
    end

    def mapping=(mapping = {})
      @mapping = mapping
    end
  end
end

begin
  require "rails"
rescue LoadError
  # do nothing
end

require "template_switcher/auto_render_switcher"
require "template_switcher/railtie"
