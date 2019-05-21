class ArcadesController < ApplicationController

    def index
        @arcades = Arcade.all
    end

    def new
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

    def show
        @arcade = Arcade.find_by(id: params[:id])
        if @arcade == nil
            redirect_to root_path
        else
            render 'show'
        end
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
            redirect_to @arcade
        else
            redirect to arcade_edit_path(@arcade)
        end
    end

    def destroy
        Arcade.find(params[:id]).destroy
        redirect_to root_path
    end

    private

    def arcade_params(*args)
        params.require(:arcade).permit(*args)
    end
end
