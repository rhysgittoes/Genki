class HealthProfilesController < ApplicationController
	before_action :require_login
	

	def index
	end

	def new
		# @health_profile = current_user.patients.find(params[:id])
		@health_profile = HealthProfile.new
	end

	def create
		# @health_profile = current_user.health_profiles.new(health_profile_params)
		@health_profile = HealthProfile.new
		if @health_profile.save
			redirect_to health_profile_path, notice: "Your profile has been created."
		else
			flash[:notice] = "Error creating new profile."
			render 'new'
		end

	end

	def show
		# @health_profile = current_user.health_profiles.find(params[:id])
		@health_profile = HealthProfile.find(params[:id])
		@allergies = health_profile.allergies.find(params[:patient_id])
		@immunizations = health_profile.immunizations.find(params[:patient_id])
		@prescriptions = health_profile.prescriptions.find(params[])
	end

	def edit
		@health_profile = current_user.health_profiles.find(params[:id])
	end

	def update
		@health_profile = current_user.health_profiles.find(params[:id])
		if @health_profile.update(health_profile_params)
			redirect_to health_profile_path, notice: "Your profile has been updated."
		else
			redirect_to edit_health_profile_path, notice: "Please try updating your profile again."
		end
	end
	

end
 
