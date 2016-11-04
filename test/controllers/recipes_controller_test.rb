require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
    test "will get index" do
        get :index
        assert_template '/'
        assert_response :success
    end

    test "will get show" do
        params[:search] = "avocado"
        page = 1
        VCR.use_cassette("recipes") do
            recipe = Recipe.by_name(params[:search], "Avocado Hollandaise", page)
            get :show, { name: recipe.name }
            assert_response :success
        end
    end

    test "will redirect to index for show requests without a valid name parameter" do
        invalid = "Gobblygook"
        get :show, { name: invalid }
        assert_response :redirect
        assert_redirected_to recipes_path
    end


end
