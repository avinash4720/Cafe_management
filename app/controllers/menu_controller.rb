class MenuController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def del
        id=params[:menuname]
        mh=Menuhelper.where(menu_id: id)
        mh.destroy_all
        m=Menu.find(id)
        m.destroy
        redirect_to "/menus"
    end
end