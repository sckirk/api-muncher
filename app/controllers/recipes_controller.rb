class RecipesController < ApplicationController
    def index
        @page = (params[:page] || 1).to_i
        if params[:search]
            @labels = health_labels(params)
            @results, @total_items =             EdamamApiWrapper.search_results(params[:search], @page, @labels)
        end
        @total_pages = ((@total_items.to_i + 9) / 10) || 1
    end

    def show
        if params[:search].nil?
            redirect_to recipes_path
        else
            @result = EdamamApiWrapper.find_one(params[:id])
        end
    end

    private

    def health_labels(params)
        labels = []
        params.each do |key, value|
            if key.include?('health_label_') && value == "1"
                labels << key.gsub('health_label_','')
            end
        end
        return labels
    end

end
