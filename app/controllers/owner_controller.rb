class OwnerController < ApplicationController
    skip_before_action :ensure_user_logged_in
  
    def index
       
        render "index"
        
    end
    def clerk
        render "clerk"
    end
    def sales
        render "sales"
    end
    def menus
        render "menus"
    end
    def order
        render "orders"
    end


  end