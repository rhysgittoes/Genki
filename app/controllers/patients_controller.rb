class PatientsController < ApplicationController

     before_action :require_login, except: [:new, :create]
    
    def index
    end
    
    def new
        @patient = Patient.new
    end
    
    def create
        @patient = Patient.new(patient_params)
        
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
end
