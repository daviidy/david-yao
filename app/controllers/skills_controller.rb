class SkillsController < ApplicationController
    before_action :authorize
    layout "admin"
    def index
        @skills = Skill.all
    end

    def new
        @skill = Skill.new
    end
    
    def create
        @skill = Skill.new(skill_params)
        if @skill.save
            flash.notice = 'Your skill has been added'
            redirect_to skills_path
        else
            render :new
        end
    end

    def edit
        @skill = Skill.find(params[:id])
    end

    def update
        @skill = Skill.find(params[:id])
        @skill.update(skill_params)

        flash.notice = "Skill '#{@skill.title}' Updated!"
        redirect_to skills_path
    end

    def destroy
        @skill = Skill.find(params[:id])
        @skill.destroy
        flash.notice = "Skill '#{@skill.title}' deleted!"
        redirect_to skills_path
    end
    
    
    private 

    def skill_params
        params.require(:skill).permit(:title, :image, :skill_type)
    end
    
    
end
