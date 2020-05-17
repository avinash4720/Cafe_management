class Category < ActiveRecord::Base
    has_many :menuitems
end