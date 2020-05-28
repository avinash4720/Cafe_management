class CartController < ApplicationController
    def index
        render "index"
    end
    def new
        items = JSON.parse(cookies[:items])
        totalcost = JSON.parse(cookies[:cost])
        order = Order.create!(cost: totalcost, date: Date.today, user_id: @current_user.id, delivered_status: false)
        items.each do |item|
            OrderItem.create!(order_id: order.id, menu_id: item["id"], item_name: item["name"], item_price: item["price"], incart: item["incart"])
        end
        flash[:session] = "Order Confirm"
        redirect_to root_path
    end

    def show
        order = Order.find(params[:id]).order_items
        render json: order
    end

end