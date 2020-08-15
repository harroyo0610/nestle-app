module Api
    class SessionsController < Devise::SessionsController
    
        private
    
        def respond_with(resource, _opts = {})
            render json: resource
        end
    
        def respond_to_on_destroy
            render json: true
        end
    end
end