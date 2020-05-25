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
        from = Date.parse(params[:from]) unless params[:from].blank?
        to = Date.parse(params[:to]) unless params[:to].blank?
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

    def invoice
      id= params[:id]
      @order=Order.find(id)
      render "invoice"
      
    end
    def deleteclerk
      id=params[:id]
      todo=User.find(id)
      todo.destroy
      redirect_to "/clerkdash"
  end
  def active
    id=params[:id]
    m=Menu.active().first
    m.active_menu=false
    m.save!
    newm=Menu.find(id)
    newm.active_menu= true
    newm.save!
    render"menus"
end

  end