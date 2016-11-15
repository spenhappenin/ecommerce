class DepartmentsController < ApplicationController
  before_action :set_store
  before_action :set_department, except: [:index, :new, :create]

  def index
    @departments = @store.departments
  end

  def new
    @department = @store.departments.new
  end

  def create
    @department = @store.departments.new(department_params)
    if @department.save
      flash[:success] = 'Department Created Successfully!'
      redirect_to store_departments_path(@store)
    else
      flash[:error] = 'Something Went Wrong!'
      render :new
    end
  end

  def edit
    if current_user.id != @store.user_id
			flash[:error] = "That Isn't Yours To Change!"
			redirect_to all_stores_path
		end
  end

  def update
    if @department.update(department_params)
      redirect_to store_departments_path(@store), success: 'Department Updated Successfully'
    else
      render :edit, error: 'Something Went Wrong!'
    end
  end

  def destroy
    if current_user.id != @store.user_id
			flash[:error] = "That Isn't Yours To Change!"
			redirect_to store_departments_path
		else
      @department.destroy
      redirect_to store_departments_path(@store), success: 'Department Deleted Successfully!'
    end
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
