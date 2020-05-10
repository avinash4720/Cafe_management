class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    skip_before_action :verify_authenticity_token
    def index
        render "index"
    end

    def new
        render "new"
    end

    def create
        name = params[:name]
        email = params[:email]
        password = params[:password]
        role = params[:role]
        new_user = User.new(
          name: name,
          email: email,
          password: password,
          role: role
        )
        if new_user.save
          redirect_to "/"
        else
          flash[:error] = new_user.errors.full_messages.join(", ")
          redirect_to new_user_path
        end
    end
    
    def login
            email = params[:email]
            password = params[:password]
            if User.where("email = ? and password = ?", email,password).empty?
              render plain: "FALSE! Login FAILED."
            else
              render plain: "TRUE! Login SUCCESSFUL."
            end
    end
end