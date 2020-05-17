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
end