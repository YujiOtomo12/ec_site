class ApplicationController < ActionController::Base
  before_action :current_cart
  private

   def current_cart
       @current_cart = Cart.find_by(id: session[:cart_id])
       @current_cart = Cart.create unless @current_cart
       session[:cart_id] = @current_cart.id
       @current_cart
   end
end
