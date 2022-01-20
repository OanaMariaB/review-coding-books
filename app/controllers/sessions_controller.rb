class SessionsController < ApplicationController

    def login

    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
       else
        flash[:errors] = ["Invalid Username or Password!"]
        redirect_to "/login"
       end
    end 

    def logout
        session.clear
        redirect_to new_user_path
    end

    def omniauth
        @user = User.find_or_create_by(username: auth["info"]["name"]) do |user|
            user.password = SecureRandom.hex(10)
            user.email = auth["info"]["email"]
        end

        if @user && @user.save
            session[:user_id] = @user.id

            redirect_to user_path(@user.id)
        else
            redirect_to "/login"
        end
    end

    private
    
    def auth 
        request.env['omniauth.auth']
    end


end