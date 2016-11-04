require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
    test "will get index" do
        get :index
        assert_template '/'
        assert_response :success
    end

    test "will get show" do
        VCR.use_cassette("recipes") do
            recipe = EdamamApiWrapper.find_one("7b359790eab01e56f8f58ed075b78f9d")
            get :show, { id: "7b359790eab01e56f8f58ed075b78f9d", search: "avocado" }
            assert_response :success
        end
    end

    test "will redirect to index for show requests without a valid name parameter" do
        invalid = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
        get :show, { id: invalid }
        assert_response :redirect
        assert_redirected_to recipes_path
    end


end
