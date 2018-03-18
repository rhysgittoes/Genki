module HealthProfileHelper

  def is_doctor?(current_user)
    current_user.type == "Doctor"
  end

  def allowed_to_view_profile?(current_user, relation, patient)
    current_user.type == "Doctor" && relation.patient_id == patient.id && relation.doctor_id == current_user.id && relation != nil
  end

  def has_health_profile?(health_profile)
    health_profile != nil
  end

  def show_health_profile(current_user, relation, patient, health_profile)
    allowed_to_view_profile?(current_user, relation, patient) && has_health_profile?(health_profile)
  end

  def patient_to_view_profile?(current_user, health_profile)
    @health_profile != nil && current_user.id == @health_profile.patient_id && current_user.type == "Patient"
  end

end
