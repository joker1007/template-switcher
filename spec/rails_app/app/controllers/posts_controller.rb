class PostsController < ApplicationController
  def index
    render_switcher :select_key, "index"
  end
end
