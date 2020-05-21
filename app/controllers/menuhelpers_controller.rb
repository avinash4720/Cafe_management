class MenuhelpersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    
    def destroy
        id=params[:id]
        todo=Menuhelper.find(id)
        todo.destroy
        redirect_to "/owner"
    end


end
