class ProductsController < ApplicationController
  before_action :set_department
  before_action :set_product, except: [:index, :new, :create]
  def index
    @products = @department.products
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
    if @product.update
      redirect_to department_product_path(@department, @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to department_products_path(@department)
  end

  private
  def product_params
    params.require(:id).permit(:name, :price, :details)
  end

  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_product
    @product = @department.products.find(params[:id])
  end
end
