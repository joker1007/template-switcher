module TemplateSwitcher
  module ActionControllerExtension
    extend ActiveSupport::Concern

    included do
      alias :__render__ :render
    end

    def render_switcher(selector, *args)
      TemplateSwitcher.mapping ||= {}

      if mapping = TemplateSwitcher.mapping[selector]
        prepend_view_path(Rails.root.join("app", mapping))
      end
      __render__(*args)
    end
  end
end
