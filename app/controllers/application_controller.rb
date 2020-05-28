class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in  
  def ensure_user_logged_in
      unless current_user
          redirect_to root_path
      end
  end

  def current_user
      return @current_user if @current_user
      current_user_id = session[:current_user_id]
      if current_user_id
          @current_user = User.find(current_user_id)
      else
          nil
      end
  end

  def check_clerk
      return @current_user if @current_user
      current_user_id = session[:current_user_id]
      if current_user_id
          if  User.find(current_user_id).role == "clerk"
              @current_user =  User.find(current_user_id)
          else
              redirect_to root_path
          end
      else
          redirect_to root_path
      end
  end
  def check_owner
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
        if  User.find(current_user_id).role == "owner"
            @current_user =  User.find(current_user_id)
        else
            redirect_to "/owner"
        end
    else
        redirect_to root_path
    end
end
end
