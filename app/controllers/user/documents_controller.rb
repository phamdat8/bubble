class User::DocumentsController < ApplicationController
    def index
        @docs = Document.all
    end
end
