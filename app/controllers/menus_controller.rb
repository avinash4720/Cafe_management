class MenusController < ApplicationController
    skip_before_action :ensure_user_logged_in
    before_action :current_user
    def del
        id=params[:menuname]
        mh=Menuhelper.where(menu_id: id)
        mh.destroy_all
        m=Menu.find(id)
        m.destroy
        redirect_to "/menusdash"
    end
    def index
        render "index"
    end
    def new
        # item = Menuitem.find(37)
        # item.delete
        # render plain: "done"
        # item =  Menuitem.create!(item_name: "Oreo coffee", img_url:"https://cafe-management.s3-ap-northeast-1.amazonaws.com/Menu+Images/thickshakes/oreo.jpg", price:"220",item_desciption:"An addictive oreo crumble shake blened with cocoa.",category_id:"16")       
        # render plain: item.id
        # c = Category.all[1]
        # item = c.menuitems
        menu_items = Menuitem.all.order(:category_id,:name)
        # menu = menui.to_json
        # cookies[:name] = menu.to_json
        render json: menu_items
    end
end