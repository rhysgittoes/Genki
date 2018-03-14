class HealthProfilesController < ApplicationController
	before_action :require_login
 health_profile

	
 master

	def index
	end

	def new
 
		@patient = Patient.find(params[:patient_id])
		# @health_profile = current_user.patients.find(params[:id])
		@health_profile = HealthProfile.new
	end

	def create
health_profile
		@patient = Patient.find(params[:patient_id])
		@health_profile = HealthProfile.new(health_profile_params)
		@health_profile.patient_id = current_user.id
		if @health_profile.save
			redirect_to patient_health_profile_path(@patient.id, @health_profile.id), notice: "Your profile has been created."
		else
			redirect_to new_patient_health_profile, notice: "Create profile unsuccessful. Please try again."

		end

	end

	def show
    health_profile
		@health_profile = HealthProfile.find(params[:id])
	end
		

	def edit
		@health_profile = Patient.find(params[:patient_id])
	end

	def update
		@health_profile = Patient.find(params[:patient_id])
		if @health_profile.update(health_profile_params)
			redirect_to patient_health_profile_path, notice: "Your profile has been updated."
		else
			redirect_to edit_patient_health_profile_path, notice: "Please try updating your profile again."
		end
	end
	
	private
	def health_profile_params
		params.require(:health_profile).permit(:weight, :height, :blood_type, :insurer)
	end

end
 
 master
