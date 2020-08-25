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

        def update
            @user = User.find(params[:id])
            if @user.update(user_params)
              puts 'the user info successfully updated' #add whatever you want
            else
              puts 'failed'
            end
        end
    end
end