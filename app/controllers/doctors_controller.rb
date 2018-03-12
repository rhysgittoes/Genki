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
  @doctor.admission_id = SecureRandom.hex(8)
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

def update
  @doctor = Doctor.find(params[:id])
  @doctor.update(doctor_params)
  redirect_to "doctors/index"
end

def search
  @patients = Patients.search(where(params[:search]))

end

def new_visit
  @doctor = current_user.patients.find(params[:id])
end

private

def doctor_params
  params.require(:doctor).permit(:first_name, :last_name, :email, :gender, :birthday, :language, :city, :country, :admission_id, :certification, :experience)  
end

end
