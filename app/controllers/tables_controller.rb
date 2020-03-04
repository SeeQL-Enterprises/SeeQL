class TablesController < ApplicationController
  def index
    @table = Table.all
  end
end
