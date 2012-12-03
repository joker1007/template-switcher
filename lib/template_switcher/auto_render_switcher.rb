module TemplateSwitcher
  module AutoRenderSwitcher
    extend ActiveSupport::Concern

    def render(*args)
      render_switcher(template_selector, *args)
    end

    def template_selector
      nil
    end

    included do
      include ActionControllerExtension
    end
  end
end
