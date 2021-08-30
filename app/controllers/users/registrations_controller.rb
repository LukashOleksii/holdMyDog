# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters!

    def new
      build_resource({})
      resource.build_profile
      respond_with(resource)
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_keys) }
    end

    def configure_permitted_parameters!
      devise_parameter_sanitizer.permit(:sign_up, keys: permitted_keys)
    end

    def permitted_keys
      [
        :email,
        :password,
        :password_confirmation,
        :remember_me,
        :type,
        { profile_attributes: %i[first_name last_name phone description] }
      ]
    end

    protected

    def after_sign_up_path_for(_resource)
      location_path
    end

    def after_sign_in_path_for(_resource)
      if current_user.type == Owner.name
        owner_path(current_user)
      else
        sitter_path(current_user)
      end
    end
  end
end
