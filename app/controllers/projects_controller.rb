class ProjectsController < ApplicationController
    before_action :authorize
    layout "admin", :except => [ :adminIndex ]
    def index
        @projects = Project.all
    end

    def adminIndex
        @projects = Project.all
    end

    def new
        @project = Project.new
    end
    
    def create
        @project = Project.create(project_params)
        if @project.save
            flash.notice = 'Your project has been added'
            redirect_to projects_path
        else
            render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)

        flash.notice = "Project '#{@project.title}' Updated!"
        redirect_to projects_path
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        flash.notice = "Project '#{@project.title}' deleted!"
        redirect_to projects_path
    end
    
    
    private 

    def project_params
        params.require(:project).permit(:title, :company, :start_year, :end_year, :short_desc, :long_desc, :github, :demo, :image, :position_id, skill_ids: [])
    end
end
