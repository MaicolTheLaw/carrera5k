class RunnersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_normal_user, except:[:index]
	
	def index 
		if current_user.type = "1"
  			redirect_to root_path
  		end	
		@runner = Runner.all
	end	

	def new
		@runner = Runner.new
	end	

	def create
		@runner = Runner.new(runner_params)
		@runner.user_id = current_user.id
		@runner.save
		redirect_to root_path
	end	

	def edit
		@runner = Runner.where(user_id:  current_user.id).take
	end	
	
	def update
		@runner = Runner.where(user_id:  current_user.id).take
		@runner.update_attributes(runner_params)	
		redirect_to root_path
	end	

	private
  	def runner_params
    	params.require(:runner).permit(:full_name, :birthday, :gender, :address, :city_of_birth, :state, :runners_team, :home_number, :mobile_number, :illness_exists, :illness_description)
  	end

  	def check_normal_user
  		if current_user.type = '0'
  			redirect_to root_path
  		end	
  	end	

end
