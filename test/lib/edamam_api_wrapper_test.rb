require 'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    test "EdamamApiWrapper.search_results will return an array of Recipes on a valid search term" do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("avocado")
            assert_kind_of Array, recipes
            assert_not recipes.empty?
            recipes.each do |recipe|
                assert_kind_of Recipe, recipe
            end
        end
    end

    test "EdamamApiWrapper.search_results will return an empty array on an invalid search term" do
        VCR.use_cassette("recipes") do
            recipes = EdamamApiWrapper.search_results("gobblygook")
            assert_kind_of Array, recipes
            assert recipes.empty?
        end
    end

end
