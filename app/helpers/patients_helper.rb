module PatientsHelper
  def relation_exist_and_equal_to_patient?(relation, current_user)
    relation == nil || relation != nil && relation.patient_id != current_user.id
  end
  
end
