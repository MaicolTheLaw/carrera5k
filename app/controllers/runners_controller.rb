class RunnersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_normal_user, except:[:index]
	
	def index 
		if current_user.user_type != 96
  		redirect_to root_path
  		end	
		@runner = Runner.joins('INNER JOIN users ON runners.user_id = users.id').all
	end	

	def new
		if Runner.where(user_id:  current_user.id).take != nil
			redirect_to :controller=>"runners", :action=> "edit" , :id => current_user.id
		end	
		@runner = Runner.new
	end	

	def create
		@runner = Runner.new(runner_params)
		@runner.user_id = current_user.id
		@runner.save		
			redirect_to :controller=>"mains", :action=> "payment" 
			
	end	

	def edit
		@runner = Runner.where(user_id:  current_user.id).take
	end	
	
	def update
		@runner = Runner.where(user_id:  current_user.id).take
		@runner.update_attributes(runner_params)	
		redirect_to edit_runner_path
	end	

	private
  	def runner_params
    	params.require(:runner).permit(:full_name, :birthday, :gender, :address, :city_of_birth, :state, :runners_team, :home_number, :mobile_number, :illness_exists, :illness_description)
  	end

  	def check_normal_user
  		if current_user.user_type == 96
  			redirect_to root_path
  		end	
  	end	

end
