class ProductsController < ApplicationController
  before_action :set_department
  before_action :set_product, except: [:index, :new, :create]
  def index
    @products = @department.products
    # @cart = Cart.find(params[:cart_id])
  end

  def show
  end

  def new
    @product = @department.products.new
  end

  def create
    @product = @department.products.new(product_params)
    if @product.save
      redirect_to department_product_path(@department, @product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to department_product_path(@department, @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to department_products_path(@department)
  end

  # def new_product
  # @products = Products.all
  # end
  #
  # def add_product
  #   @cart.products << Product.find(params[:product_id])
  #   redirect_to cart_path(@cart)
  # end

  private
  def product_params
    params.require(:product).permit(:name, :price, :details, :image)
  end

  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_product
    @product = @department.products.find(params[:id])
  end
end
