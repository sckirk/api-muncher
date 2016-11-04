class RecipesController < ApplicationController
    def index
        @page = (params[:page] || 1).to_i
        if params[:search]
            @results =             EdamamApiWrapper.search_results(params[:search], @page)
        end
    end

    def show
        if params[:search].nil?
            redirect_to recipes_path
        else
            @result = Recipe.by_name(params[:search], params[:name], params[:page])
        end
    end
end
