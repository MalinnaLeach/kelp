class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		if current_user
			@restaurant = current_user.restaurants.new(restaurant_params)
			if @restaurant.save
				flash[:success] = "Restaurant was successfully added"
				redirect_to '#index'
			else
				render 'new'
			end
		else
			flash[:error] = "You must be signed in"
			redirect_to '#index'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if current_user && current_user.id == @restaurant.user.id
				if @restaurant.update(restaurant_params)
					flash[:success] = "Restaurant was successfully updated"
					redirect_to @restaurant
				else
					render 'edit'
				end
		else
			flash[:error] = "You must be signed in as owner"
			redirect_to @restaurant
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if current_user && current_user.id == @restaurant.user.id
			@restaurant.destroy
			redirect_to '#index'
		else
			flash[:error] = "You must be signed in as owner"
			redirect_to '#index'
		end
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:name, :description, {images: []})
		end
end
