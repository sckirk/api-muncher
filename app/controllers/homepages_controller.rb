class HomepagesController < ApplicationController
    def index
        if params[:search]
            @results = Recipe.results(params[:search])
        end
    end

    def show;end
end
