class UsersController < ApplicationController
    def index
        render plain: User.all.map {|user| user.to_formatted_string}.join("\n")
    end
end