class CartController < ApplicationController
  before_action :set_cart, except: [:index, :new, :create]
  def index
    @carts = Carts.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
  def cart_params
    params.require(:cart).permit
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
