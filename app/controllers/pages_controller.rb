class PagesController < ApplicationController

  # :id
  def index
    # check user has permissions
    @posts = User.where(:id).first.posts
  end

  def show
  end
end