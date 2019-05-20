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

    private

    def arcade_params(*args)
        params.require(:arcade).permit(*args)
    end
end
