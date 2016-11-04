require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    test "EdamamApiWrapper.search_results will return an array of Recipes on a valid search term" do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("avocado", 1)
            assert_kind_of Array, recipes
            assert_not recipes.empty?
            recipes.each do |recipe|
                assert_kind_of Recipe, recipe
            end
        end
    end

    test "EdamamApiWrapper.search_results will return an empty array on an invalid search term" do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("gobblygook", 1)
            assert_kind_of Array, recipes
            assert recipes.empty?
        end
    end

    test "EdamamApiWrapper.find_one will return one recipe object given a valid URI" do
        valid_uri = "7b359790eab01e56f8f58ed075b78f9d"
        VCR.use_cassette("recipes") do
            recipe = EdamamApiWrapper.find_one(valid_uri)
            assert_kind_of Recipe, recipe
        end
    end

    test "EdamamApiWrapper.find_one will return nil given a valid URI" do
        invalid_uri = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
        VCR.use_cassette("recipes") do
            recipe = EdamamApiWrapper.find_one(invalid_uri)
            assert_nil recipe
        end
    end
end
