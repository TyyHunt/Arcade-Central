class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :security, :arcade_present?, :owner, :authorized?

    private

    def current_user
        @current_user ||= Player.find(session[:player_id]) if session[:player_id]
    end

    def logged_in?
        session[:player_id]
    end

    def security
        if !logged_in?
            redirect_to 'signin'
        end
    end
end
