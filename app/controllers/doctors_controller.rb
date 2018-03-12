class DoctorsController < ApplicationController
  
  before_action :set_doctor, only: [:edit, :show, :update]

def index
end

def new
  @doctor = Doctor.new  
end

def create
  if @doctor.save
    redirect_to doctors_path
  else
    flash[:notice] = "Sorry, there was an error creating your account. Please try again."
    redirect_to new_doctor_path
  end
end

def edit
end

def update
end

def search
  @patients = Patient.where("first_name ILIKE ? OR last_name ILIKE ?", params[:search], params[:search])
end

def show
end

private

def set_doctor
  @doctor = Doctor.find(params[:id])
end

end
