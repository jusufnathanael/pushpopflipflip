class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company, :role])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company, :role])
        end

end
