module Api
  class UsersController < ApplicationController
      def update
        user = User.find(params[:user][:id])
        if user.update(user_params)
          render json: { 'response': "#{user.username} info successfully updated" }
        else
          render json: { 'response': "There was as error" }
        end
      end
    
      def get_user_type
        user = User.find(params[:id])
        render json: { 'role': user.role }
      end

      def get_user_by_username
        user = User.find_by(username: params[:username])
        render json: user
      end

      def get_user_by_id
        user = User.find(params[:id])
        render json: user
      end

      private
      
      def user_params
          params.require(:user).permit(:id, :username, :gravatar_url, :password, :password_confirmation)
      end
  end
end