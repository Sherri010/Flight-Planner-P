class ApplicationController < ActionController::Base
  #  protect_from_forgery unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
  # private
  #   def authenticate
  #       authenticate_or_request_with_http_token do |token, options|
  #           @auth_user = User.find_by(auth_token: token)
  #       end
  #   end
   protect_from_forgery with: :null_session

    # def authenticate
    #     authenticate_or_request_with_http_token do |token, options|
    #         user = User.find_by(auth_token: token)

    #         if user
    #             return true
    #         else
    #             render :json => { error: "Invalid Token" }, status: 401
    #         end
    #     end
    # end

    def after_sign_in_path_for(resource)
      "/dashboard"
    end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:avatar])
  end
end
