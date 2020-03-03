class DatabasesController < ApplicationController
  def show
    @database = Database.find(params[:id])
  end

end
