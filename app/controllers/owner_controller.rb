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
    def report
        user = params[:user]
        u=User.find_by_name(user)
        from = Date.parse(params[:from])
        to = Date.parse(params[:to])
        if user.blank?
          @orders = Order.where("date >= ? AND date <= ?", from, to)
        elsif from.blank? && to.blank?
          @orders = Order.where("user_id = ?", u.id)
        elsif user.blank? && from.blank? && to.blank?
          @orders = Order.all
        else
          @orders = Order.where("date >= ? AND date <= ? AND user_id = ?", from, to, u.id)
        end
        render "report"
    end


  end