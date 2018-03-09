class DoctorsController < ApplicationController

def index
  @doctors = Doctor.all
end

def new
  @doctor = Doctor.new  
end

def create
  @doctor = Doctor.new(doctor_params)
  if @doctor.save
  else
    render "new"
  end
end

def edit
  @doctor = Doctor.find(params[:id])
end

end
