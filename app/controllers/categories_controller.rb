class CategoriesController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def create
        name=params[:name]
        new_category=Category.new(name: name)
          if new_category.save
            redirect_to owner_path
          else

          end
      end
      def index
        render plain: "ok"
    end
    def new
    #  Category.delete_all
        category = Category.all
        render plain: category[6].name
    end
end