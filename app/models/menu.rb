class Menu < ActiveRecord::Base
    has_many :menuitems
    has_many :categories
    has_many :menuhelpers
    def self.active 
        all.where(active_menu: true)
    end
end