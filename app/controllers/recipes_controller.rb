class RecipesController < ApplicationController
    def index
        @page = (params[:page] || 1).to_i
        if params[:search]
            @results =             EdamamApiWrapper.search_results(params[:search], @page)
            @total_items = EdamamApiWrapper.total_items(params[:search])
            @total_pages = (((@total_items + 9) / 10) || 1).to_i
        end
        @total_pages = ((@total_items.to_i + 9) / 10) || 1
    end

    def show
        if params[:search].nil?
            redirect_to recipes_path
        else
            @result = Recipe.by_name(params[:search], params[:name], params[:page])
        end
    end
end
