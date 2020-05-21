class User < ActiveRecord::Base
    has_secure_password
    def to_formatted_string
        "#{id}.  #{name}  - #{role}-#{password}"
    end
    def self.clerk
        all.where(role: "clerk")
    end
    def self.customer
        all.where(role: "customer")
    end
end