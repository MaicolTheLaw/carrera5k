class RoutesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_admin_user
	skip_before_filter :verify_authenticity_token  
	
	def index
		@route = Route.all
		
	end

	def new
		@route = Route.new
	end

	def create
		route_params = params
		name1   = route_params.extract!(:name)
		name  = name1[:name]
		inicio1 = route_params.extract!(:inicioruta)
		inicio  = inicio1[:inicioruta]
		final1  = route_params.extract!(:finalruta)
		final  = final1[:finalruta]
		route_params.extract!(:action)
		route_params.extract!(:controller)

		Route.create(start_point: inicio, finish_point: final, name: name)
		route_id = Route.last.id

		route_params.each do |key, value|
			location = value
			puts "#{location.inspect} #{route_id.inspect}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			Waypoint.create(location: location, route_id: route_id)
		end

		redirect_to routes_path

		puts "params: #{route_params} <<<<<<<<<<<<<<<<<<<<<<"
		# @route = Route.new(route_params)
		# @route.save
		# 
	end

	def show
		@route  = Route.find(params[:id])
		@inicio = @route.start_point
		@final  = @route.finish_point
		@filas  = Waypoint.where(route_id: params[:id])
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
