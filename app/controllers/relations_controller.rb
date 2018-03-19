class RelationsController < ApplicationController

def new
  @relation = Relation.new
end

def create
  @relation = Relation.new(relation_params)
  @patient = current_user
  @doctor = Doctor.find_by_id(params[:id])
  @relation.save
  doctor = Doctor.find(@relation.doctor_id)
  redirect_to patients_path, notice: "You has given #{doctor.first_name}" + " " + "#{doctor.last_name} permission to view your profile."
end

def destroy
  @relation = Relation.find_by_id(params[:id])
  @relation.destroy
  doctor = Doctor.find(@relation.doctor_id)
  flash[:notice] = "You had removed #{doctor.first_name}" + " " + "#{doctor.last_name}'s permission to view your page."
  redirect_to patients_path
end

private

def relation_params
  params.require(:relation).permit(:doctor_id, :patient_id)
end

end