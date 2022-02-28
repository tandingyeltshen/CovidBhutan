class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def is_admin
        if current_user.has_role? :admin
            true
        else
            redirect_to "/dashboard", notice: "Not authorized."
        end
    end

    def is_user
        if current_user.has_role? :user
            true
        else
            redirect_to "/admin", notice: "Not authorized."
        end
    end

    protected

    def after_sign_in_path_for(resource)
        if current_user.has_role? :admin
            "/admin"
        elsif current_user.has_role? :user
            "/dashboard"
        else
            redirect_to "/users/sign_in", notice: "Invalid Crediential"
        end
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized."
        redirect_to(request.referrer || '/admin')
    end
end
