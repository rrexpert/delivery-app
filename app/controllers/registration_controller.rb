class RegistrationController < ApplicationController
  skip_before_action :authenticate_request

  def create
    success = true
    message = ""
    valid_user_types = ['Buyer', 'Supplier']

    if params[:email].present? && params[:password].present? && params[:user_type].present?
      if !valid_user_types.include?(params[:user_type])
        success false
        message = "valid user type is 'Buyer' or 'Supplier'"
      else
        user = User.create(type: params[:user_type], name: params[:name], email: params[:email],
                           phone: params[:phone], password: params[:password],
                           password_confirmation: params[:password])
        message = "#{params[:user_type]} is successfully registered"
      end
    else
      success = false
      message = "email, password and user_type are required"
    end

    render json: { success: success, message: message }
  end
end
