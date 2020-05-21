class MenuitemsController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def create
        name=params[:name]
        category=params[:category]
        price=params[:price]
        url=params[:url]
        cat=Category.find_by_name(category)
        new_menuitem=Menuitem.new(name: name,category_id: cat.id,price: price,img_url: url)
        if new_menuitem.save
            redirect_to owner_path
          else

          end
    end
    def destroy
        id=params[:id]
        todo=Menuitem.find(id)
        todo.destroy
        redirect_to "/owner"
    end


end
