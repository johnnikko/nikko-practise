require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @customer = Category.create(name: "nikko", gender: "male", status: "single", age: "22", email: "nikko@gmail.com", address: "dasma", user_id: 2)
    @user = User.create(username: "john", email: "john@gmail.com", password: "password", position: "staff")
  end

  test "get customer" do
    get customer_path(@customer)
    assert_response :success
  end
end
