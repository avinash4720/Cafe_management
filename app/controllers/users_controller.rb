class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    skip_before_action :verify_authenticity_token
    def index
        render "index"
    end

    def new
        render "new"
    end

    def clerk
      name = params[:name]
      password = "1234"
      role="clerk"
      email= params[:name]
      new_user = User.new(
        first_name: name,
        email: email,
        password: password,
        role: role
      )
      if new_user.save
        redirect_to "/clerkdash"
      else
        flash[:error] = new_user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end

    def new
      user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        role:"customer"
      )
      if user.save
        session[:current_user_id]=user.id
        flash[:session] = "Hey, " + params[:first_name].capitalize
        redirect_to root_path
      end
  end

  def create
    user=User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:current_user_id] = user.id
        
        if user.role=="owner"
          redirect_to "/owner"
        else
          flash[:session] = "Signed In"
        redirect_to menus_path
        end
      else
        flash[:error] = "Login Invalid"
        redirect_to root_path
    end
  end

  def destroy
    session[:current_user_id]=nil
    @current_user = nil
    flash[:session] = "Signed Out"
    redirect_to root_path
  end
end
