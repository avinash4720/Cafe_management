class MenuhelpersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    
    def destroy
        id=params[:id]
        todo=Menuhelper.find(id)
        todo.destroy
        redirect_to "/owner"
    end
    def create
        name=params[:name]
        menu_ids=params[:menu_ids]
        menu=Menu.new(name: name,active_menu: false)
        menu.save
        menu_ids.each do |item|
            i=Menuitem.find(item)
            mh=Menuhelper.new(menu_id: menu.id,menuitem_id: item,category_id: i.category_id)
            mh.save
        end
        redirect_to "/menus"
    end


end
