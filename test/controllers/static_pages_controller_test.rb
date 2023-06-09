require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = " | Luca's Pizza"
  end 
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help#{@base_title}"
  end

  test "should get menu" do 
    get menu_path
    assert_response :success
    assert_select "title", "Menu#{@base_title}"
  end 

  test "should get drinks" do 
    get drinks_path
    assert_response :success
    assert_select "title", "Drinks#{@base_title}"
  end 
end
