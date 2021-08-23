# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters!

    def new
      build_resource({})
      resource.build_profile
      respond_with resource
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up) do |user|
        user.permit(
          :email,
          :password,
          :password_confirmation,
          :remember_me,
          :type,
          profile_attributes: %i[first_name last_name phone description]
        )
      end
    end

    def configure_permitted_parameters!
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: [
          :email,
          :password,
          :password_confirmation,
          :remember_me,
          :type,
          profile_attributes: %i[first_name last_name phone description]
        ]
      )
    end
  end
end
