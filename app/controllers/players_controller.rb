class PlayersController < ApplicationController
    def show
        @player = Player.find_by(id: params[:id])
        if logged_in? && @player != nil
            render :show
        else
            redirect_to root_path
        end
    end
    
    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)
       
        if @player.save
            session[:player_id] = @player.id
            redirect_to @player
        else
            render 'new'
        end
    end

    def edit
        @player = Player.find_by(id: params[:id])
        if @player == current_user
            render 'edit'
        elsif @player == nil
            redirect_to root_path
        else
            redirect_to @player
        end
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            redirect_to @player
        else
            redirect to player_edit_path(@player)
        end
    end

    def destroy
        Player.find(params[:id]).destroy
        session.clear
        redirect_to root_path
    end

    private

    def player_params
        params.require(:player).permit(:username, :age, :allowance, :password)
    end

end
