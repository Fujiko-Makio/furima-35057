class ItemsController < ApplicationController


  def index
    
  end

  def new
    @items = Items.order("created_at DESC")
  end

  #def create  
  #end
end
