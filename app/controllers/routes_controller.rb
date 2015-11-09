class RoutesController < ApplicationController
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
end
