class CartController < ApplicationController
  before_action :set_cart

  def show
  end

  def add_product
    @cart.products << Product.find(params[:product_id])
  end

  private
    def set_cart
      @cart = Cart.first
    end
end
