require "test_helper"

class UserTest < ActiveSupport::TestCase
 
  def setup 
    @user = User.new(name: "RANDOM" , email: "ranndom@mail.com",
                    password: "random123", password_confirmation: "random123")
  end 

  test "should return valid" do 
    assert @user.valid? 
  end 

  test "name should be present" do 
   @user.name = "   "
   assert_not @user.valid?
  end
  
  test "email should be present" do 
    @user.email = "      "
    assert_not @user.valid? 
  end 


  test "name should not be too long" do 
    @user.name = "a" * 60
    assert_not @user.valid?
  end 

  test "email should not be too long" do 
    @user.email = "a" * 300 + "@example.com"
    assert_not @user.valid?
  end 

 test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
    @user.email = valid_address
    assert @user.valid?, "#{valid_address.inspect} should be valid"
end


end
    
    test "should not accept invalid e-mail adresses" do 
      invalid_email = %w[user@example,com user_at_foo.org user.name@example.
        foo@bar_baz.com foo@bar+baz.com]
      invalid_email.each do |inve|
        @user.email = invalid_email 
        assert_not @user.valid? , "#{invalid_email.inspect} is invalid"
      end 
    end 


    test "email should be saved in lowercase" do 
      mixed_case_email = "PllUcA1660@gmail.com"
      @user.email = mixed_case_email
      @user.save
      assert_equal mixed_case_email.downcase, @user.reload.email 
    end 

    test "password should not be blank" do 
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end 

    test "password should be longer than 6 characters" do 
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end

    test "authenticated? should return false for a user with a nil digest" do 
      assert_not @user.authenticated?("")
    end 
  end
