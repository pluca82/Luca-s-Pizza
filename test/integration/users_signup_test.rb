require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
    get signup_path
      assert_no_difference 'User.count' do 
      post users_path, params: { user: { name: " ", 
                                        email: "invalid",
                                        password: "foo",
                                        password_confirmation: "fooo"}}
      end
    assert_template 'users/new'
  end 

  test "valid sighup information" do 
    get signup_path
      assert_difference 'User.count' , 1 do 
        post users_path, params: { user: { name: "Andrei",
                                          email: "euandrei123@gmail.com",
                                          password:"1234567",
                                          password_confirmation:"1234567"}}
      end 
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end 
end
