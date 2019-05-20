class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.all
    end

    def new
        @arcade = Arcade.new
    end

    def create
        @arcade = Arcade.new(arcade_params(:name, :location, :open_time, :close_time, :est_year))
        if @arcade.save
            redirect_to arcade_path(@arcade)
        else
            redirect_to new_arcade_path
        end
    end

    def show
        @arcade = Arcade.find(params[:id])
    end

    def edit
        @arcade = Arcade.find_by(id: params[:id])
        if @arcade.owner_name == current_user.username
            render 'edit'
        elsif @arcade == nil
            redirect_to root_path
        else
            redirect_to @arcade
        end
    end

    def update
        @arcade = Arcade.find(params[:id])
        if @Arcade.update(arcade_params(:name, :open_time, :close_time))
            redirect_to @player
        else
            redirect to player_edit_path(@player)
        end
    end

    private

    def arcade_params(*args)
        params.require(:arcade).permit(*args)
    end
end
