module Api
    class SessionsController < Devise::SessionsController

        def create
            self.resource = warden.authenticate!(auth_options)
            set_flash_message!(:notice, :signed_in)
            sign_in(resource_name, resource)
            yield resource if block_given?
            
            respond_with resource, location: after_sign_in_path_for(resource)
        end

        def signed_in
            render json: { "response": user_signed_in? }
        end
    
        private
    
        def respond_with(resource, _opts = {})
            if resource.id.nil? 
                render json: { "error": "No hay usuarios con los datos que ingresó" }
            else
                render json: resource
            end
        end
    
        def respond_to_on_destroy
            render json: { "response": true }
        end
    end
end
