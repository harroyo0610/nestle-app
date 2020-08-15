module Api
    class RegistrationsController < Devise::RegistrationsController
        
        def create
            build_resource(sign_up_params)
            
            resource.save
            render json: resource, status: :created         
        end
    end
end