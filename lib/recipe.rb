class Recipe
    attr_reader :name, :url, :ingredients, :dietary_info

    def initialize(name, url, ingredients, dietary_info)
        @name = name
        @url = url
        @ingredients = ingredients
        @dietary_info = dietary_info
    end
end
