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
            @games = @arcade.games.abc_order
        else 
            @games = Game.abc_order
        end
        respond_to do |f|
            f.js
            f.html{render :index}
            f.json {render json: @games}
        end
    end

    def embedded_new
        security
        @game = Game.new
    end

    def new
        security
        @arcade = Arcade.find_by(id: params[:arcade_id])
        @game = Game.new
        respond_to do |f|
            f.js
            f.html{render :new}
            f.json {render json: @game}
        end
    end

    def create
        @game = Game.new(game_params)
        respond_to do |f|
            f.js
            f.html{render :show}
            f.json {render json: @game}
        end
        if @game.save
            redirect_to game_path(@game)
        else
            render 'new'
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

    def show_arcade
        if @arcade == nil
            @arcade = 1
        else
            @arcade.id
        end
    end

end
