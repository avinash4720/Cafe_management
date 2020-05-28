class Menuitem < ActiveRecord::Base
    belongs_to :category
    def self.name_sort
        all.order(:item_name)
    end
end