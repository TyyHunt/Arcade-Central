class SessionsController < ApplicationController
    def new
        if current_user
            redirect_to player_path(current_user)
        else
            @player = Player.new
        end
    end
    
      
    def create
        if auth        
            auth_params = auth['info']['nickname']
            if @player = Player.find_by(username: auth_params) 
                session[:player_id] = @player.id
            else
                @player = Player.create(username: auth_params, password: auth['credentials']['token'])

                session[:player_id] = @player.id
            end
            redirect_to player_path(@player)
        else @player = Player.find_by(username: params[:player][:username])
            if @player && @player.authenticate(params[:player][:password])
                session[:player_id] = @player.id
                redirect_to player_path(@player)
            else
                flash[:notice] = "Username or Password is Invalid"
                redirect_to signin_path
            end
        end
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