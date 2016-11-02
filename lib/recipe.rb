class Recipe
    attr_reader :name, :image, :url, :ingredients, :dietary_info

    def initialize(name, image, url, ingredients, dietary_info)
        @name = name
        @image = image
        @url = url
        @ingredients = ingredients
        @dietary_info = dietary_info
    end
end
