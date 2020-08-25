module Api
    class UsersController < ApplicationController
        def update
            user = User.find(params[:user][:id])
            if user.update(user_params)
              puts "#{user.username} info successfully updated"
            else
              puts 'Failed'
            end
        end

        private
        
        def user_params
            params.require(:user).permit(:username, :gravatar_url)
        end
    end
end