class HealthProfileController < ApplicationController

	def index
	end

	def new
		@health_profile = Health_profile.new
	end

	def create
		@health_profile = current_user.health_profiles.new(health_profile_params)
		if @health_profile.save
			redirect_to 
		else
			render 'new'
		end

	end

	def show
		@health_profile = Health_profile.find(params[:id])
	end

	
	

end
