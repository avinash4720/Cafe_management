class DashboardController < ApplicationController
    skip_before_action :ensure_user_logged_in
    before_action :check_clerk
    def index
        render "index"
    end

    def update
        order = Order.find(params[:id])
        order.delivered_status = true ;
        order.save!
        redirect_to dashboard_index_path
    end
end