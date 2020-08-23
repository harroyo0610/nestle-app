module Api
    class RegistrationsController < Devise::RegistrationsController
        
        def create
            build_resource(sign_up_params)
            if resource.save
                render json: resource, status: :created
            else
                render json: resource.errors.messages, status: :unauthorized
            end                
        end
    end
end