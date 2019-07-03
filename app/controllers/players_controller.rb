class PlayersController < ApplicationController
    
    def show
        @player = Player.find_by(id: params[:id])
        if @player != nil
            render :show
        else
            redirect_to root_path
        end
    end
    
    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params(:username, :age, :allowance, :password))
       
        if @player.save
            session[:player_id] = @player.id
            redirect_to @player
        else
            render 'new'
        end
    end

    def edit
        security
        @player = Player.find_by(id: params[:id])
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(player_params(:username, :age, :allowance))
            redirect_to @player
        else
            redirect_to edit_player_path(@player)
        end
    end

    def destroy
        @player = Player.find(params[:id]).destroy
        if @player == current_user
            session.clear
        end
        redirect_to root_path
    end

    private

    def player_params(*args)
        params.require(:player).permit(*args)
    end

end
