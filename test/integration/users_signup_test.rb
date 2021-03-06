require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { first_name: "",
                               last_name: "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { first_name: "test",
                                            last_name: "user",
                                            email: "user@valid.com",
                                            password:              "foobarrr",
                                            password_confirmation: "foobarrr"  }
    end
    assert_template 'users/show'
  end
end
