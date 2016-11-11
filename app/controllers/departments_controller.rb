class DepartmentsController < ApplicationController
  before_action :set_store
  before_action :set_department, except: [:index, :new, :create]

  def index
    @departments = @store.departments
  end

  def show
  end

  def new
    @department = @store.departments.new
  end

  def create
    @department = @store.departments.new(department_params)
    if @department.save
      redirect_to store_department_path(@store, @department)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      redirect_to store_department_path(@store, @department)
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to store_departments_path(@store)
  end

  private
    def department_params
      params.require(:department).permit(:name, :phone_number)
    end

    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_department
      @department = @store.departments.find(params[:id])
    end
end
