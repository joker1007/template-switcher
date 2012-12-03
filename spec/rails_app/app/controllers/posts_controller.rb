class PostsController < ApplicationController
  def index
    render_switcher template_selector, "index"
  end

  def new
    render "new"
  end
end
