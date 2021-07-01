class PositionsController < ApplicationController
    before_action :authorize
    def index
    end

    def new
        @position = Position.new
    end

    def create
        @position = Position.new(position_params)
        flash.notice = 'Your position has been added'
        redirect_to positions_path
    end

    def edit
        @position = Position.find(params[:id])
    end

    def update
        @position = Position.find(params[:id])
        @position.update(position_params)

        flash.notice = "Position '#{@position.title}' Updated!"
        redirect_to positions_path
    end

    def destroy
        @position = Position.find(params[:id])
        @position.destroy
        flash.notice = "Position '#{@position.title}' deleted!"
        redirect_to positions_path
    end
    
    
    private 

    def position_params
        params.require(:position).permit(:title)
    end
end
