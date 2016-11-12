class StoresController < ApplicationController
	before_action :set_store, except: [:index, :new, :create]

  def index
  	@stores = Store.all
  end

  def show

  end

  def new
  	@store = Store.new
  end

  def create
  	@store = Store.new(store_params)
  	if @store.save
  		redirect_to store_departments_path(@store)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update 
  	if @store.update(store_params)
  		redirect_to store_path(@store)
  	end
  end

  def destroy 
  	@store.destroy
    redirect_to stores_path
  end 


  private 

  def store_params
  	params.require(:store).permit(:name, :owner, :location)
  end

  def set_store
  	@store = Store.find(params[:id])
  end

end
