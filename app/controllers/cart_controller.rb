class CartController < ApplicationController
  before_action :set_cart

  def show
    @products = @cart.products
  end

  def add_product
    product = Product.find(params[:product_id])
    @cart.products << product
    flash[:success] = 'Product Added To Cart!'
    redirect_to department_products_path(product.department)
  end

  def remove_product
    # find the product by the ID
    # figure out how to delete the product from the carts products - cart.products []
    # redirect_to department_products_path
    product = Product.find(params[:product_id])
    @cart.products.delete(product)
    redirect_to cart_path(@cart)
  end

  def clear_cart
    @cart.products = []
    redirect_to cart_path(@cart)
  end

  private
    def set_cart
      @cart = Cart.first || Cart.create
    end
end
