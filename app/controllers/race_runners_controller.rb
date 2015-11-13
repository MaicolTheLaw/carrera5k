class RaceRunnersController < ApplicationController

def index
	@race_editions = params[:race_edition_id]

end


def new

	@race_editions = params[:race_edition_id]
@runner_id = params[:runner_id]
@has_payment = params[:has_payment]
@has_kit = params[:has_kit]
@runner_number = params[:runner_number]
	@racerunners = RaceRunner.new
end


def create
@race_editions = params[:race_runner][:race_edition_id]
@runner_id = params[:race_runner][:runner_id]
@has_payment = params[:race_runner][:has_payment]
@has_kit = params[:race_runner][:has_kit]
@runner_number = params[:race_runner][:runner_number]
	@racerunners = RaceRunner.new(race_edition_id: @race_editions,runner_id: @runner_id, has_payment: @has_payment,has_kit: @has_kit, runner_number: @runner_number)
	if @racerunners.save 
	redirect_to root_path
	end
end	

end
