class RelationsController < ApplicationController

def new
  @relation = Relation.new
end

def create
  @relation = Relation.new(relation_params)
  @patient = current_user
  @doctor = Doctor.find_by_id(params[:id])
  @relation.save
  redirect_to patients_path
end

def destroy
  @relation.destroy
end

private

def relation_params
  params.require(:relation).permit(:doctor_id, :patient_id)
end

end