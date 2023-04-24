require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = " | Luca's Pizza"
  end 
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help#{@base_title}"
  end

  test "should get menu" do 
    get static_pages_menu_url
    assert_response :success
    assert_select "title", "Menu#{@base_title}"
  end 

  test "should get drinks" do 
    get static_pages_drinks_url
    assert_response :success
    assert_select "title", "Drinks#{@base_title}"
  end 
end
