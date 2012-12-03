require "template-switcher"
require "spec_helper"

describe PostsController do
  render_views

  describe "#render_switcher" do
    context "given template_selector is nil" do
      before do
        mod = Module.new do
          def template_selector
            nil
          end
        end

        PostsController.send :include, mod
      end

      it do
        get :index
        response.should render_template("posts/index")
        response.body.should_not =~ /switch/
      end
    end

    context "given template_selector is :select_key" do
      before do
        mod = Module.new do
          def template_selector
            :select_key
          end
        end

        PostsController.send :include, mod
      end

      it do
        get :index
        response.should render_template("posts/index")
        response.body.should  =~ /switch/
      end
    end

    context "given template_selector is undefined key" do
      before do
        mod = Module.new do
          def template_selector
            :undefined_key
          end
        end

        PostsController.send :include, mod
      end

      it do
        get :index
        response.should render_template("posts/index")
        response.body.should_not  =~ /switch/
      end
    end
  end

  describe TemplateSwitcher::AutoRenderSwitcher do
    before do
      PostsController.send :include, TemplateSwitcher::AutoRenderSwitcher
    end

    context "given template_selector is :select_key" do
      before do
        mod = Module.new do
          def template_selector
            :select_key
          end
        end

        PostsController.send :include, mod
      end

      it do
        get :new
        response.should render_template("posts/new")
        response.body.should  =~ /switch/
      end
    end
  end
end
