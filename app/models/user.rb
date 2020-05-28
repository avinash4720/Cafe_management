class User < ActiveRecord::Base
    has_secure_password
    has_many :orders
    def to_formatted_string
        "#{id}.  #{name}  - #{role}-#{password}"
    end
    def self.clerk
        all.where(role: "clerk")
    end
    def self.customer
        all.where(role: "customer")
    end
    def walkin
        if role == "clerk"
            return true
        end
    end

    def online
        return true if role == "customer"
    end
end