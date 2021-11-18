class User::DocumentsController < ApplicationController
    before_action :authenticate_user!
    def index
        @docs = Document.all
    end
end
