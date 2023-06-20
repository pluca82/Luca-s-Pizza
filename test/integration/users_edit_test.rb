require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user = users(:michael)
  end 
=begin
  test "unsuccesful edit" do 
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: " ",
                                              email: "foo@invalid.com",
                                              password: "nustiu",
                                              password_confirmation: "123"}}
    assert_template 'users/edit'
  end 

  test "succesful edit" do 
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Michael Example"
    email ="michael@example.com"
    patch user_path(@user), params: { user: { name: name ,
                                              email: email,
                                              password:  " ",
                                              password_confirmation: " "}}
    @user.reload
    assert_equal name, @user.name 
    assert_equal email, @user.email
  end 
=end 
end
