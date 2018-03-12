class DoctorsController < ApplicationController

   before_action :require_login, except: [:new, :create]

def index
  @doctors = Doctor.all
end

def new
  @doctor = Doctor.new  
end

def create
  @doctor = Doctor.new(doctor_params)
  if @doctor.save
    redirect_to "doctors/show"
  else
    render "new"
  end
end

def show
  @doctor = Doctor.find(params[:id])
end

def edit
  @doctor = Doctor.find(params[:id])
end


private

def doctor_params
  params.require(:doctor).permit(:first_name, :last_name)  
end

end
