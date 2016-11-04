require 'httparty'

class EdamamApiWrapper
    BASE_URL = "https://api.edamam.com/search?q="
    ID = ENV["id"]
    KEY = ENV["key"]

    def self.search_results(query_term, page)
        begin_index = (page.to_i - 1) * 10
        url = BASE_URL + query_term + "&app_id=#{ ID }&app_key=#{ KEY }&from=#{ begin_index }"
        data = HTTParty.get(url)
        recipe_results = []
        if data["hits"]
            data["hits"].each do |recipe|
                wrapper = Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["image"], recipe["recipe"]["url"], recipe["recipe"]["ingredientLines"], recipe["recipe"]["healthLabels"])
                recipe_results << wrapper
            end
        end
        return recipe_results
    end
end
