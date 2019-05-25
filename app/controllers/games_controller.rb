class GamesController < ApplicationController

    def show
        if arcade_present?
            @arcade = Arcade.find(params[:arcade_id])
            @game = @arcade.games[params[:id].to_i]
            if @game != nil
                arcade_game_path(@game)
            else
                redirect_to arcade_path(@arcade)
            end
            raise params.inspect
        else @game = Game.find_by(id: params[:id]) 
            if @game != nil
             @arcade = @game.arcade
            else
                redirect_to root_path
            end
        end
    end


    def index
        if arcade_present?
            @arcade = Arcade.find(params[:arcade_id])
            @games = @arcade.games
        else !arcade_present?
            @games = Game.all
        end
    end

    def new
        security
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        @game.valid?
        if @game.save
            redirect_to game_path(@game)
        else
            redirect_to new_game_path
        end
    end

    def edit
        security
        @game = Game.find_by(id: params[:id])
        if  @game == nil
            redirect_to root_path
        end
    end

    def update
        @game = Game.find(params[:id])
        if @game.update(game_params)
            redirect_to @game
        else
            redirect to game_edit_path(@game)
        end
    end

    def destroy
        security
        @game = Game.find(params[:id])
        if authorized?
            @game.destroy
            redirect_to root_path
        else
            redirect_to game_path(@game)
        end
    end

    private

    def game_params
        params.require(:game).permit(:name, :num_players, :cost, :working, :arcade_id, :player_id)
    end

    def arcade_present?
        params[:arcade_id] && Arcade.find_by(id: params[:arcade_id]) != nil
    end

end
