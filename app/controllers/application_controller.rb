class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= Player.find(session[:player_id]) if session[:player_id]
    end

    def logged_in?
        session[:player_id]
    end
end
