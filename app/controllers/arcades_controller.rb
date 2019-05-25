class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.all
    end

    def show
        security
        @arcade = Arcade.find_by(id: params[:id])
        no_arcade?
        if @arcade
            @games = @arcade.games
            arcade_path(@arcade)
        end
    end

    def new
        security
        @arcade = Arcade.new
    end

    def create
        @arcade = Arcade.new(arcade_params(:name, :location, :open_time, :close_time, :est_year, :owner_name))
        if @arcade.save
            redirect_to arcade_path(@arcade)
        else
            redirect_to new_arcade_path
        end
    end

    def edit
        @arcade = Arcade.find_by(id: params[:id])
        no_arcade?
        if authorized?
            render 'edit'
        else
            redirect_to @arcade
        end
    end

    def update
        @arcade = Arcade.find(params[:id])
        if @arcade.update(arcade_params(:name, :open_time, :close_time))
            redirect_to @arcade
        else
            redirect to arcade_edit_path(@arcade)
        end
    end

    def destroy
        @arcade = Arcade.find_by(params[:id])
        no_arcade?
        if owner
            @arcade.destroy
            redirect_to root_path
        else
            redirect_to @arcade
        end
    end

    private

    def arcade_params(*args)
        params.require(:arcade).permit(*args)
    end

    def no_arcade?
        if @arcade == nil
         redirect_to root_path
        end
    end

end
