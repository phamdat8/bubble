class User::HomesController < ApplicationController
    def index
        @user = User.find(current_user.id)
    end

    def edit
        @home = User.find(current_user.id)
    end
end
