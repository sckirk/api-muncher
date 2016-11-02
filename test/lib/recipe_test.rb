require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    #
    # INSTANCE METHODS
    #

    test "Recipr can be created with name, url, ingredients and dietary info" do
        name = "test name"
        url = "test_url.com"
        ingredients = ["tomatoes", "onions"]
        dietary_info = ["Vegan", "Gluten-Free"]
        r = Recipe.new(name, url, ingredients, dietary_info)
        assert_kind_of Recipe, r
        assert_equal r.name, name
        assert_equal r.url, url
        assert_equal r.ingredients, ingredients
        assert_equal r.dietary_info, dietary_info
    end

end
