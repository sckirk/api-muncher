class HomepagesController < ApplicationController
    def index
        if params[:search]
            @results = Recipe.results(params[:search])
        end
    end
end
