class RoutesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin_user
	
	def index
		@route = Route.all
	end

	def new
		@route = Route.new
	end

	def create
		@route = Route.new(route_params)
		@route.save
		redirect_to routes_path
	end

	def show
		@route = Route.find(params[:id])
	end

	def destroy
		@route = Route.find(params[:id])
		@route.destroy
		redirect_to routes_path
	end

	private
	def route_params
  	params.require(:route).permit(:name, :start_point, :finish_point)
	end

	def check_admin_user
  		if current_user.user_type != 96
  			redirect_to root_path
  		end	
  	end
end
