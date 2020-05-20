class Menuhelper < ActiveRecord::Base
    has_many :menuitems
    has_many :categories
    belongs_to :menu
    def self.of_user(menu,category)
        all.where(menu_id: menu.id , category_id: category.id)
      end
end