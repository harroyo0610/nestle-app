class ApplicationController < ActionController::Base
    respond_to :html, :json
    skip_before_action :verify_authenticity_token

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    return admin_root_path if resource&.role == 'admin'

    index_path
  end
end
