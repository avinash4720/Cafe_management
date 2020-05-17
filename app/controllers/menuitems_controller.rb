class MenuitemsController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def create
        name=params[:name]
        category=params[:category]
        price=params[:price]
        cat=Category.find_by_name(category)
        new_menuitem=Menuitem.new(name: name,category_id: cat.id,price: price)
        if new_menuitem.save
            redirect_to owner_path
          else

          end
    end


end
