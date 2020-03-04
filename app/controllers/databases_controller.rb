class DatabasesController < ApplicationController
  def show
    @comment = Comment.new
    @database = Database.find(params[:id])
  end

end
