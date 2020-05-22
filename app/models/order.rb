class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    def self.pending
        all.where(delivered_status: false).count
    end
    def self.pendingorder
        all.where(delivered_status: false)
    end
    def self.delivered_today
        all.where(delivered_status: true, date: Date.today).count
    end
    def self.delivered
        all.where(delivered_status: true);
    end
end
