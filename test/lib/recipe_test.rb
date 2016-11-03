require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    #
    # INSTANCE METHODS
    #

    test "Recipe can be created with name, image, url, ingredients and dietary info" do
        name = "test name"
        image = "https://www.edamam.com/web-img/108/108bb897a2fd724bc1461d77031a560f.jpg"
        url = "test_url.com"
        ingredients = ["tomatoes", "onions"]
        dietary_info = ["Vegan", "Gluten-Free"]
        r = Recipe.new(name, image, url, ingredients, dietary_info)
        assert_kind_of Recipe, r
        assert_equal r.name, name
        assert_equal r.image, image
        assert_equal r.url, url
        assert_equal r.ingredients, ingredients
        assert_equal r.dietary_info, dietary_info
    end

    test "ArgumentError will be raised and Recipe object will not be created if it's missing one or more parameters from the API call" do
        name = "test name"
        image = "https://www.edamam.com/web-img/108/108bb897a2fd724bc1461d77031a560f.jpg"
        url = "test_url.com"
        ingredients = ["tomatoes", "onions"]
        dietary_info = ["Vegan", "Gluten-Free"]

        assert_raises ArgumentError do
            missing_name = Recipe.new(image, url, ingredients, dietary_info)
            return missing_name
        end

        assert_raises ArgumentError do
            missing_image_and_ingredients = Recipe.new(name, url, dietary_info)
            return missing_image_and_ingredients
        end
    end


    #
    # CLASS methods
    #

    test "Recipe.results will return an array of Recipes" do
        VCR.use_cassette("recipes") do
            recipes = Recipe.results("avocado")
            assert_kind_of Array, recipes
            assert_not recipes.empty?
            recipes.each do |recipe|
                assert_kind_of Recipe, recipe
            end
        end
    end
end
