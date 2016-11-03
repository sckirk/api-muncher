class Recipe
    attr_reader :name, :image, :url, :ingredients, :dietary_info

    def initialize(name, image, url, ingredients, dietary_info)
        @name = name
        @image = image
        @url = url
        @ingredients = ingredients
        @dietary_info = dietary_info
    end

    def self.results(query_term)
        return EdamamApiWrapper.search_results(query_term)
    end
end
