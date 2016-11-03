require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
    test "will get index" do
        get :index
        assert_template '/'
        assert_response :success
    end

    # I'd like to get this test to pass... HOW?
    # test "will get show" do
    #     valid_name = "Avocado Paletas"
    #     get :show, { name: valid_name }
    #     assert_response :success
    # end

    # This one doesn't work either--how do I set up this test correctly?
    test "will get show" do
        VCR.use_cassette("recipes") do
            recipe = Recipe.by_name("avocado", "Avocado Hollandaise")
            get :show, name: recipe.name
            assert_response :success
        end
    end

    test "will redirect to index for show requests without a valid name parameter" do
        invalid = "Gobblygook"
        get :show, { name: invalid }
        assert_response :redirect
        assert_redirected_to root_path
    end


end
