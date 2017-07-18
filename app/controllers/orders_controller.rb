class OrdersController < ApplicationController
before_filter :authenticate_user!
before_filter :admin_only

  def index    
    @orders = Order.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destryoy
  end

  private

  def admin_only
    authenticate_user!
    if current_user.admin
      return
    else
      flash[:notice] = "I'm sorry, that page is for the Admin only."
      redirect_to root_path
    end
  end

end

