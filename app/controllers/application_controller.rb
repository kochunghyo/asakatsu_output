# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nickname first_name last_name first_name_kana last_name_kana
                                               face_image birthday])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[nickname first_name last_name first_name_kana last_name_kana
                                               face_image birthday])
  end
end
