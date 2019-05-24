class SessionsController < ApplicationController
    def new
        if current_user
            redirect_to '/'
        else
            @player = Player.new
        end
    end
    
    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          @user.save
          session[:user] = @user
          redirect_to root_path
        else
          redirect_to sign_up_path
        end
      end
      
    def create
        @player = Player.find_by(username: params[:username])
        if @player && @player.authenticate(params[:player][:password])
            @user.save
            session[:player_id] = @player.id
            redirect_to player_path(@player)
        else
            redirect_to 'signup'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end