class LinksController < ApplicationController
    before_action :authorize
    layout "admin"
    def index
        @links = Link.all
    end

    def new
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        if @link.save
            flash.notice = 'Your postiion has been added'
            redirect_to links_path
        else
            render :new
        end
    end

    def edit
        @link = Link.find(params[:id])
    end

    def update
        @link = Link.find(params[:id])
        @link.update(link_params)

        flash.notice = "Link '#{@link.title}' Updated!"
        redirect_to links_path
    end

    def destroy
        @link = Link.find(params[:id])
        @link.destroy
        flash.notice = "Link '#{@link.title}' deleted!"
        redirect_to links_path
    end
    
    
    private 

    def link_params
        params.require(:link).permit(:text, :path)
    end
end
