class User < ActiveRecord::Base
    has_secure_password
    def to_formatted_string
        "#{id}.  #{name}  - #{role}-#{password}"
    end
end