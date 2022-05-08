class ListController < ApplicationController

    def index
        @clients = Client.all
    end
end
