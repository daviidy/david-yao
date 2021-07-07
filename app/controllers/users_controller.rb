class UsersController < ApplicationController
    before_action :authorize, only: %i[home]
    before_action :auth, only: %i[new]
    layout "welcome", :only => [ :welcome ]
    layout "admin", :only => [ :home ]
    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/home'
        else
            redirect_to '/signup' 
        end
    end 

    def home
        @projects = Project.all
    end

    def welcome
        render :welcome
    end
    

    private 

    def user_params
        params.require(:user).permit(:name)
    end
end
