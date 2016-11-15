class StoresController < ApplicationController
	before_action :set_store, except: [:index, :new, :create, :all_stores]

  def index
  	@stores = current_user.stores
  end

  def show
  end

  def new
  	@store = current_user.stores.new
  end

  def create
  	@store = current_user.stores.new(store_params)
  	if @store.save
			flash[:success] = 'Store Created Successfully!'
  		redirect_to store_departments_path(@store)
  	else
			flash[:error] = 'Something Went Wrong!'
  		render :new
  	end
  end

  def edit
		if current_user.id != @store.user_id
			flash[:error] = "That Isn't YoursTo Change!"
			redirect_to all_stores_path
		end
  end

  def update
  	if @store.update(store_params)
  		redirect_to store_departments_path(@store), success: 'Store Updated Successfully'
		else
			render :edit, error: 'Something Went Wrong!'
  	end
  end

  def destroy
		if current_user.id != @store.user_id
			flash[:error] = "That Isn't Yours To Change!"
			redirect_to all_stores_path
		else
  	@store.destroy
    redirect_to stores_path, success: 'Stores Deleted Successfully!'
		end
  end

	def all_stores
		@stores = Store.all
	end

  private
	  def store_params
	  	params.require(:store).permit(:name, :owner, :location, :color)
	  end

		def set_store
	  	@store = current_user.stores.find(params[:id])
	  end
end
