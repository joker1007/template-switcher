module TemplateSwitcher
  class Railtie < ::Rails::Railtie
    initializer 'template_switcher' do |_app|
      ActiveSupport.on_load(:action_controller) do
        require "template_switcher/action_controller_extension"
        ::ActionController::Base.send :include, TemplateSwitcher::ActionControllerExtension
      end
    end
  end
end
