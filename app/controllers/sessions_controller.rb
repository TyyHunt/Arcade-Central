class SessionsController < ApplicationController
    def new
        if current_user
            redirect_to player_path(current_user)
        else
            @player = Player.new
        end
    end
    
      
    def create
        @player = Player.find_by(username: params[:player][:username])
        if @player && @player.authenticate(params[:player][:password])
            session[:player_id] = @player.id
            redirect_to player_path(@player)
        else
            flash[:notice] = "Username or Password is Invalid"
            redirect_to signin_path
        end
    end

    def github
        @player = Player.find_or_create_by(uid: auth['uid']) do |u|
          u.uid = auth['uid']
          u.password = 'Temporary'
          u.email = auth['info']['email']
        end
    
        session[:player_id] = @player.id
    
        redirect_to root_path
      end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
      end
end